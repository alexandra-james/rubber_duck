class DucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_duck, only: [:show, :edit, :update, :destroy]

  def index
    @ducks = policy_scope(Duck)
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { user: }),
        marker_html: render_to_string(partial: "marker", locals: {user: })
      }
    end
  end

  def show
    authorize @duck
  end

  def new
    @duck = Duck.new
    authorize @duck
  end

  def create
    @duck = Duck.new(duck_params)
    @user = current_user
    @duck.user = @user
    authorize @duck
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @duck
  end

  def update
    authorize @duck
    if @duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @duck
    @duck.destroy
    redirect_to ducks_path, status: :see_other
  end

  private

  def set_duck
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:name, :description, :language, :image_url, :price)
  end
end
