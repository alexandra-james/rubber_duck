class Duck < ApplicationRecord
  LANGUAGES = ["Ruby", "JavaScript", "Python", "Go", "Java", "Rust",
               "C", "C++", "C#", "PHP", "TypeScript", "Swift", "Dart"]

  belongs_to :user
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :language, presence: true, inclusion: { in: LANGUAGES }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :image_url, presence: true
end
