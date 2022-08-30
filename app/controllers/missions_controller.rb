class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @missions = Mission.all
  end

  def my_missions
    @missions = Mission.where('user_id = ?', current_user)
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
