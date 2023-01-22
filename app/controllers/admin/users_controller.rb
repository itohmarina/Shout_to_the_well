class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.is_deleted == false
      @user.update(is_deleted: true)
      redirect_to admin_users_path
    else
      @user.update(is_deleted: false)
      redirect_to admin_users_path
    end
  end

end
