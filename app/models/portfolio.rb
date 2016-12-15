class Portfolio < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :movements, through: :positions
  has_many :valuations
  before_save :default_amount

  belongs_to :user

  validates :name,
            presence: { message: "must be given." }

  def portfolio_value
    value = positions.collect{|position| position.quantity * position.price }.sum.round(2)
    update_attribute(:amount, value)
    amount
  end

  def create_valuation
    valuations.build(:amount, self.amount)
    save
  end

  def new_price_data
    price_array = []
    positions.each do |pos|
      price = YAHOO_CLIENT.quotes([pos.ticker], [:last_trade_price]).first
      price = price['last_trade_price'].to_f
      price = price * pos.quantity
      price_array << price
    end
    price_array
  end

  def calculate_amount
    price ||= new_price_data.inject(&:+)
    price.round(2)
  end

  def update_portfolio_amount
    update_attribute(amount: calculate_amount)
  end

  private

    def default_amount
      self.amount ||= 0.0
    end

    def ticker_info
      positions.pluck(:ticker)
    end

end
