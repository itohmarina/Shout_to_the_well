class Public::GroupUsersController < ApplicationController

  def new
    @users = current_user.followings
    @group_user = GroupUser.new
  end

  def create
    current_user.invite_group(params[:group_id])
    redirect_to request.referer
  end

  def destroy
    current_user.leave_group(params[:group_id])
    flash[:notice] = "グループを退会しました"
    redirect_to public_user_path(current_user.id)
  end

  #グループ参加リクエストを受け付ける
  def accept
    @group_user = GroupUser.find(params[:id])
    @group_user.request_is_accepted = true
    if @group_user.update
      flash[:notice] = "グループに参加しました"
      redirect_to public_group_path(@group_user.group.id)
    else
      redirect_to request.referer
    end
  end


end
