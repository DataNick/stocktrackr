class Portfolio < ApplicationRecord
  has_many :positions
  has_many :movements, through: :positions
  belongs_to :user

  validates_uniqueness_of :ticker, scope: :portfolio_id
end
