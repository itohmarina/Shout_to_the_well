class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user=User.find(params[:id])
    @stories=@user.stories
  end

  def index
    @user=User.find(params[:id])
    @stories=@user.stories
  end

  def edit
    @user=current_user
  end

  def update
    @user=current_user

    if @user.update(user_params)
      redirect_to my_page_path(current_user.id), notice: "ユーザー情報を更新しました"
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


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end

end
