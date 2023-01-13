class Public::FavoritesController < ApplicationController

  def create
    @story=Story.find(params[:format])
    favorite=current_user.favorites.new(story_id: @story.id)
    favorite.save
    redirect_to public_story_path(@story.id)
  end

  def destroy
    @story=Story.find(params[:id])
    favorite=current_user.favorites.find_by(story_id: @story.id)
    favorite.destroy
    redirect_to public_story_path(@story.id)
  end

end
