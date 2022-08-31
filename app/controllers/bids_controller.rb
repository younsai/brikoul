class BidsController < ApplicationController
  before_action :set_bid, only: %i[show edit update destroy]
  before_action :set_mission, only: %i[new create]
  def index
    @bids = Bid.where('user_id = ?', current_user)
  end

  def show
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.user = current_user
    @bid.mission = @mission
    if @bid.save
      redirect_to bids_path(@bid)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @bid.message = bid_params
    @bid.price = bid_params
    if @bid.update(bid_params)
      redirect_to bid_path(@bid)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bid.destroy
    redirect_to bids_path, status: :see_other
  end

  private

  def bid_params
    params.require(:bid).permit(:message, :price, :accepted)
  end

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def set_mission
    @mission = Mission.find(params[:mission_id])
  end
end
