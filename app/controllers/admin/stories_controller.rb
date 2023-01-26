class Admin::StoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @stories = Story.all.where(is_deleted: true)
  end

  def update
    @story = Story.find(params[:id])
    if @story.is_deleted == false
      @story.update(is_deleted: true)
      redirect_to request.referer
    else
      @story.update(is_deleted: false)
      redirect_to request.referer
    end
  end

end
