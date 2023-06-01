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
    duck_id = params[:duck_id]
    @booking = Booking.new(user_id: current_user.id, duck_id: duck_id)
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept_booking
  # link to this method and then the update method from bookings index page -> button "accept booking"
  # set booking - params?
    authorize @booking
    @booking.status = true
  end

  def update
    # set booking
    authorize @booking
    @booking.update
  end

end
