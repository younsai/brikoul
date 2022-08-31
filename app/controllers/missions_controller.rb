class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_mission, only: %i[show]

  def index
    @missions = Mission.all
  end

  def my_missions
    @missions = Mission.where('user_id = ?', current_user)
  end

  def show
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @bid.user = current_user
    @bid.mission = @mission
    if @bid.save
      redirect_to my_missions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def mission_params
    params.require(:bid).permit(:title, :details, :price)
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
