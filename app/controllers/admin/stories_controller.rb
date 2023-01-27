class Admin::StoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @stories = Story.all.where(is_deleted: true, is_private: false)
  end

  def update
    @story = Story.find(params[:id])
    if @story.is_deleted == false
      @story.update(is_deleted: true)
      redirect_to public_story_path(@story.id)
    else
      @story.update(is_deleted: false)
      redirect_to public_story_path(@story.id)
    end
  end

end
