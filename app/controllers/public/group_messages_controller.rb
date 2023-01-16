class Public::GroupMessagesController < ApplicationController
  before_action :for_group_show

  def create
    group_message = GroupMessage.new(group_message_params)
    group_message.user_id = current_user.id
    group_message.group_id = @group.id

    if group_message.save!
      redirect_to public_group_path(@group.id)
    else
      render "public/groups/show"
    end
  end

  def destroy
    group_message = GroupMessage.find(params[:id])

    if group_message.destroy
      redirect_to public_group_path(@group.id)
    else
      render "public/groups/show"
    end
  end



  private

  def group_message_params
    params.require(:group_message).permit(:group_id, :body)
  end

  def for_group_show
    @group = Group.find(params[:group_id])
    @users = @group.users
    @group_messages = GroupMessage.where(group_id: @group.id)
    @group_message = GroupMessage.new
  end

end
