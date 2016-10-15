class Position < ApplicationRecord
  belongs_to :portfolio
  has_many :movements

  validates_uniqueness_of :ticker, scope: :portfolio_id
end
