class GroupsController < ApplicationController
  before_action :group, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @group.update group_params
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:first_name, :last_name, :email, :phone_number)
  end

  def group
    @group = Group.find(params[:id])
  end
end
