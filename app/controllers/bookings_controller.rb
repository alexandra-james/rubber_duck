class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    duck_ids = Duck.where(user_id: current_user).pluck(:id) # get all the duck ids where the owner is the current user
    # pluck returns the values of the column you specify
    @duck_bookings = Booking.where(duck_id: duck_ids)
  end

  def new
    @duck = Duck.find(params[:duck_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.duck = Duck.find(params[:duck_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = true
    @booking.save
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def bookings_params
    params.require(:booking).permit(:comment)
  end
end
