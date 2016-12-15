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

  private

    def default_amount
      self.amount ||= 0.0
    end
end
