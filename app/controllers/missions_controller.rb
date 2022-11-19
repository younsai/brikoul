class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_mission, only: %i[show]

  def index
    if params[:query].present?

      @missions = Mission.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @missions = Mission.all
    end
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
    @mission.user = current_user
    if @mission.save
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
    params.require(:mission).permit(:title, :details, :price)
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
