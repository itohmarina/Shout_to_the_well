class Public::StoriesController < ApplicationController
  def show
    @story=Story.find(params[:id])
  end

  def new
    @story=Story.new
    @user=current_user
  end

  def create
    @story=Story.new(story_params)
    @story.user_id = current_user.id
    if @story.save
      redirect_to public_story_path(@story.id), notice: "ストーリーを投稿しました"
    else
      redirect_to users_my_page_path(@story.user)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def story_params
    params.require(:story).permit(:genre_id, :title, :body, :is_private)
  end

end
