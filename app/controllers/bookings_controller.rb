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
    duck_id = params[:duck_id]
    @booking = Booking.new(user_id: current_user.id, duck_id: duck_id, comment: params[:booking][:comment])
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
    head :no_content
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end
end
