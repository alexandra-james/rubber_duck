class DucksController < ApplicationController
  before_action :set_duck, only: [:show, :new, :create]

  def index
    @ducks = Duck.all
    @ducks = policy_scope(Duck)
  end

  def show
    authorize @duck
  end

  def new
    authorize @duck
  end

  def create
    authorize @duck
  end

  private

  def set_duck
    @duck = Duck.find(params[:id])
  end
end
