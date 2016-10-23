class Portfolio < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :movements, through: :positions

  belongs_to :user

  validates :name,
            presence: { message: "must be given." }

end
