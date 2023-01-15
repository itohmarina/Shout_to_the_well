class Public::GroupUsersController < ApplicationController

  def index
    @groups = Group.where(user_id: current_user.id)
  end

  def create
    @group_user = GroupUser.new(group_id: params[:group_user][:group_id])
    @group_user.user_id=current_user.id
  end

  #グループ参加リクエストを受け付ける
  def accept
    @group_user = GroupUser.find(params[:id])
    @group_user.request_is_accepted = true
    if @group_user.update
      flash[:notice] = "グループに参加しました"
      redirect_to public_group_path(@group_user.group.id)
    else
      render "public/users/show"
    end
  end

  def destroy
    @group_user = GroupUser.find(params[:id])
    if @group_user.destroy
      flash[:notice] = "グループを退会しました"
      redirect_to my_page_path
    else
      render "public/groups/show"
    end
  end

end
