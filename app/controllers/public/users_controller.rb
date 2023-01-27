class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :story_index]

  def show
    @user=User.find(params[:id])
    @group_users = GroupUser.where(user_id: current_user, request_is_accepted: false)
  end

  def index
    @users=User.where(is_deleted: false).order(id: "DESC").page(params[:page])
  end

  def story_index
    @user = User.find(params[:id])
    @stories = @user.stories.where(is_private: false, is_deleted: false).page(params[:page])
    @private_stories = @user.stories.where(is_private: true, is_deleted: false).page(params[:page])
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
      redirect_to root_path, method: :delete, notice: "退会しました。ご利用、ありがとうございました。"
    else
      render 'public/users/show'
    end
  end

  def group_index
    @user = User.find(params[:id])
    @groups = @user.groups.where(is_deleted: false)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end

end
