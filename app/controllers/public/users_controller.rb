class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user=User.find(params[:id])
    @stories=@user.stories
    @group_users = GroupUser.where(user_id: current_user, request_is_accepted: false)
  end

  def index
    @users=User.where(is_deleted: false)
  end

  def story_index
    @user=User.find(params[:id])
    @stories=@user.stories
  end

  def edit
    @user=current_user
  end

  def update
    @user=current_user

    if @user.update(user_params)
      redirect_to public_user_path(current_user.id), notice: "ユーザー情報を更新しました"
    else
      render 'public/users/edit'
    end
  end

  def unsubscribe
  end

  def withdrawal
    @user=current_user

    if @user.update(is_deleted: true)
      reset_session
      redirect_to root_path, method: :delete, notice:"退会しました。ご利用、ありがとうございました。"
    else
      render 'public/users/show'
    end
  end

  def group_index
    @user = User.find(params[:id])
    @group_users = GroupUser.where(user_id: @user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end

end
