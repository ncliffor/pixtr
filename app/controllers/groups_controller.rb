class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path(@group)
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @images = @group.images
    @members = @group.members
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
