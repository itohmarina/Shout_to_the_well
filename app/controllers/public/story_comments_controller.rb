class Public::StoryCommentsController < ApplicationController
  before_action :authenticate

  def create
    @story = Story.find(params[:story_id])
    @story_comment = StoryComment.new(story_comment_params)
    @story_comment.user_id = current_user.id
    @story_comment.story_id = @story.id
    @user = @story.user
    @story_comments = @story.story_comments.order(id: "DESC").page(params[:page])
    @comments = Comment.all.where(is_deleted: false)
    if @story_comment.save
      redirect_to story_path(@story.id)
    else
      render "public/stories/show"
    end
  end

  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story = @story_comment.story
    if @story_comment.destroy
      redirect_to story_path(@story.id)
    else
      render "public/stories/show"
    end
  end

  private

  def story_comment_params
    params.require(:story_comment).permit(:comment_id)
  end

  def authenticate
    unless user_signed_in?
      flash[:notice] = "ログインすると、コメントを送ることができます"
      redirect_to request.referer
    end
  end

end
