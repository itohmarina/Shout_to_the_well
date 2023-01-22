class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only:[:show]
  before_action :authenticate
  
  def show
    @user=User.find(params[:id])
    @stories=@user.favorite_stories
  end

  def create
    @story=Story.find(params[:format])
    favorite=current_user.favorites.new(story_id: @story.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @story=Story.find(params[:id])
    favorite=current_user.favorites.find_by(story_id: @story.id)
    favorite.destroy
    redirect_to request.referer
  end


  private
  
  def authenticate
    unless user_signed_in?
      flash[:notice] = "ログインすると、「いいね」できます"
      redirect_to request.referer
    end
  end 

end
