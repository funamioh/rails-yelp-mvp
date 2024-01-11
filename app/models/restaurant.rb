class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # when restaurant is destroyed, its reviews will also be destroyed

  validates :name, :address, :phone_number, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"]}
end
