class LeadersController < ApplicationController
  before_action :leader, only: [:edit, :update, :destroy]

  def index
    @leaders = Leader.all
  end

  def new
    @leader = Leader.new
  end

  def create
    @leader = Leader.new leader_params
    if @leader.save
      redirect_to leaders_path, notice: 'Leader has created successfully'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @leader.update leader_params
      redirect_to leaders_path, notice: 'Leader has updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @leader.destroy
    flash[:notice] = 'Leader has deleted successfully'
    redirect_to leaders_path
  end

  private

  def leader_params
    params.require(:leader).permit(:first_name, :last_name, :email, :phone_number)
  end

  def leader
    @leader = Leader.find(params[:id])
  end
end
