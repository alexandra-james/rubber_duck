class DucksController < ApplicationController
  before_action :set_duck, only: [:show]

  def index
    @ducks = Duck.all
    @ducks = policy_scope(Duck)
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

  private

  def set_duck
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:name, :description, :language, :image_url, :price)
  end
end
