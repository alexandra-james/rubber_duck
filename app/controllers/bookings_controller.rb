class BookingsController < ApplicationController
  def index
    @bookings = Bookings.all
  end
end
