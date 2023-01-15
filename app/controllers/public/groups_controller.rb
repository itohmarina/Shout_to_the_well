class Public::GroupsController < ApplicationController

  def new
    @group=@Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save!
      redirect_to public_group_path(@group.id)
    else
      render root_path
    end
  end

  def index
    @groups = Group.all
  end


  def edit
    @group = Group.find(@params[:id])
  end

  def update
    @group = Group.find(@params[:id])
    if @group.update(group_params)
      redirect_to public_group_path(@group.id)
    else
      render "public/groups/edit"
    end
  end

#グループを削除(無効化)する
  def close
    @group = Group.find(params[:id])
    @group.is_deleted = true
    if @group.update
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
