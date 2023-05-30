class DucksController < ApplicationController
  def index
    @ducks = Duck.all
    @ducks = policy_scope(Duck)
  end

  def show
    @duck = Duck.find(params[:id])
    authorize @duck
  end
end
