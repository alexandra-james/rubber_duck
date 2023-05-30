class DucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @ducks = Duck.all
    @ducks = policy_scope(Duck)
  end

  def show
    @duck = Duck.find(params[:id])
    authorize @duck
  end

  
end
