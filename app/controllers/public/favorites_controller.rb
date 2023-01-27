class Public::FavoritesController < ApplicationController
  before_action :authenticate, except:[:show]
  
  def show
    @user=User.find(params[:id])
    @stories=@user.favorite_stories.page(params[:page])
  end

  def create
    @story=Story.find(params[:format])
    favorite=current_user.favorites.new(story_id: @story.id)
    favorite.save
  end

  def destroy
    @story=Story.find(params[:id])
    favorite=current_user.favorites.find_by(story_id: @story.id)
    favorite.destroy
  end


  private
  
  def authenticate
    unless user_signed_in?
      flash[:notice] = "ログインすると、「いいね」できます"
      redirect_to request.referer
    end
  end 

end
