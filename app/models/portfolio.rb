class Portfolio < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :movements, through: :positions
  has_many :valuations
  before_create :default_amount

  belongs_to :user

  validates :name,
            presence: { message: "must be given." }

  def portfolio_value
    value = positions.collect{|position| position.quantity * position.price }.sum.round(2)
    update_attribute(:amount, value)
    amount
  end

  def create_valuation
    valuations.build(amount: self.amount)
    save
    amount
  end

  def new_price_data
    price_array = []
    if !positions.empty?
      positions.each do |pos|
        price = YAHOO_CLIENT.quotes([pos.ticker], [:last_trade_price]).first
        price = price['last_trade_price'].to_f
        price = price * pos.quantity
        price_array << price
      end
    else
      price_array << 0
    end
    price_array
  end

  def calculate_amount
    price = self.new_price_data.inject(&:+)
    price
  end

  def update_portfolio_amount
    update_attribute(:amount, self.calculate_amount.round(2))
  end

  private

    def default_amount
      self.amount = 0.0
    end

end
