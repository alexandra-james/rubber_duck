class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def new
    @duck = Duck.find(params[:duck_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
  end
end
