class Portfolio < ApplicationRecord
  has_many :positions
  has_many :movements, through: :positions
  belongs_to :user

end
