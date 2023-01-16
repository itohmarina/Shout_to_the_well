class Public::GroupUsersController < ApplicationController

  def new
    @users = current_user.followings
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.new
  end

  def create
    user = User.find(params[:invited_id])
    user.invite_group(params[:group_id])
    redirect_to request.referer
  end

  def destroy
    current_user.leave_group(params[:group_id])
    flash[:notice] = "グループを退会しました"
    redirect_to public_user_path(current_user.id)
  end

  #グループ参加リクエストを受け付ける
  def accept
    @group_user = GroupUser.find_by(group_id: params[:group_id], user_id: current_user.id)

    if @group_user.update(request_is_accepted: true)
      flash[:notice] = "グループに参加しました"
      redirect_to public_group_path(@group_user.group.id)
    else
      redirect_to request.referer
    end
  end


end
