class Portfolio < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :movements, through: :positions
  has_many :valuations

  belongs_to :user

  validates :name,
            presence: { message: "must be given." }

  def portfolio_value
    value = positions.collect{|position| position.quantity * position.price }.sum.round(2)
    update_attribute(:amount, value)
    amount
  end

  def store_value
    valuations.build(amount: amount)
    save
  end

end
