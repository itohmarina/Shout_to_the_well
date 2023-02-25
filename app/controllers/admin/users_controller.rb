class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.where(is_deleted: true)
  end

  def update
    @user=User.find(params[:id])
    if @user.is_deleted == false
      @user.update(is_deleted: true)
      redirect_to user_path(@user.id)
    else
      @user.update(is_deleted: false)
      redirect_to user_path(@user.id)
    end
  end

end
