class GroupMembershipsController < ApplicationController
  def create
    membership = GroupMembership.new(member_id: current_user.id, group_id: params[:group_id])

    if membership.save
      redirect_to groups_path
    end
  end
end
