class Portfolio < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :movements, through: :positions
  has_many :valuations

  belongs_to :user

  validates :name,
            presence: { message: "must be given." }

  def portfolio_value
    amount = positions.collect{|position| position.quanity * position.value }.sum.round(2)
  end

end
