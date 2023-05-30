class Booking < ApplicationRecord
  belongs_to :duck
  belongs_to :user

  validates :duck_id, presence: true
  validates :user_id, presence: true
end
