class Public::FavoritesController < ApplicationController

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

end
