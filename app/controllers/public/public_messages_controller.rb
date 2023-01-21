class Public::PublicMessagesController < ApplicationController

  def index
    @public_messages = PublicMessage.page(params[:page])
    @public_message = PublicMessage.new
  end

  def create
    @public_message = PublicMessage.new(public_message_params)
    @public_message.user_id = current_user.id
    @public_message.save
    redirect_to public_messages_path
  end

  def destroy
    @public_message = PublicMessage.find(params[:id])
    @public_message.destroy
    redirect_to public_messages_path
  end

  private

  def public_message_params
    params.require(:public_message).permit(:body)
  end

  #admin機能つけたら、destroyに追加する
  def is_matching_login_users
    user_id=@public_message.user_id.to_i
    login_user_id = current_user.id
    if(user_id != login_user_id) && (admin != login_user_id)
      redirect_to users_my_page_path(login_user_id)
    end
  end

end
