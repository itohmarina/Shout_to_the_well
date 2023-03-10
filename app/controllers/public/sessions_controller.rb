# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  def guest_sign_in
    user=User.guest
    sign_in user
    redirect_to root_path, notice: 'guestuserでログインしました。'
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  # end


  def user_state
    @user = User.find_by(name: params[:user][:name])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted==true
      redirect_to new_user_session_path
    else
      "public/sessions#create"
    end
  end
end
