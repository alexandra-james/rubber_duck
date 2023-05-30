class Booking < ApplicationRecord
  belongs_to :duck
  belongs_to :user
end
