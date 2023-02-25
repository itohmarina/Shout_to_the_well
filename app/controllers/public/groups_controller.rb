class Public::GroupsController < ApplicationController
  before_action :authenticate_user!, except:[:show, :index]

  def new
    @user = current_user
    @group = Group.new
  end

  def create
    @group=Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      GroupUser.create!(group_id: @group.id, user_id: current_user.id, request_is_accepted: true)
      redirect_to group_path(@group.id)
    else
      render "public/groups/new"
    end
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users.where(is_deleted: false)
    @group_messages = GroupMessage.where(group_id: @group.id).order(id: "DESC").page(params[:page])
    @group_message = GroupMessage.new
  end

  def index
    @groups = Group.where(is_deleted: false).order(id: "DESC").page(params[:page])
  end


  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group.id)
    else
      render "public/groups/edit"
    end
  end

#グループを削除(無効化)する
  def close
    @group = Group.find(params[:id])
    if @group.update(is_deleted: true)
      flash[:notice] = "グループが削除されました"
      redirect_to root_path
    else
      render "public/groups/show"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction)
  end

end
