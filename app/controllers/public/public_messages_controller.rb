class Public::PublicMessagesController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def index
    @public_messages = PublicMessage.page(params[:page])
    @public_message = PublicMessage.new
  end

  def create
    unless user_signed_in?
      redirect_to request.referer
    end 
    @public_message = PublicMessage.new(public_message_params)
    @public_message.user_id = current_user.id
    @public_message.save
    redirect_to public_messages_path
  end

  def destroy
    @public_message = PublicMessage.find(params[:id])
    is_matching_login_users
    @public_message.destroy
    redirect_to public_messages_path
  end

  private

  def public_message_params
    params.require(:public_message).permit(:body)
  end

  #コメントは、投稿者と管理者のみが削除
  def is_matching_login_users
    user_id=@public_message.user_id.to_i
    login_user_id = current_user.id
    if(user_id != login_user_id) && (admin != login_user_id)
      redirect_to public_user_path(login_user_id)
    end
  end


end
