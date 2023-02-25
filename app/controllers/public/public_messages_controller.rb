class Public::PublicMessagesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :destroy]

  def index
    @public_messages = PublicMessage.order(id: "DESC").page(params[:page])
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
     #コメントは、投稿者と管理者のみが削除
    unless admin_signed_in?
      is_matching_login_users
    end
    @public_message.destroy
    redirect_to public_messages_path
  end

  private

  def public_message_params
    params.require(:public_message).permit(:body)
  end

  def is_matching_login_users
    user_id=@public_message.user_id.to_i
    login_user_id = current_user.id
    if user_id != login_user_id
      redirect_to user_path(login_user_id)
    end
  end


end
