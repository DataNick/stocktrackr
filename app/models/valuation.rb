class Valuation < ApplicationRecord
  belongs_to :portfolio

  def log_amount
    portfolio
  end
end
