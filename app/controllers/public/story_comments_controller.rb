class Public::StoryCommentsController < ApplicationController
  
  def create
    @story_comment=StoryComment.new(params[:story_id][:comment_id])
    @story_comment.user_id=current_user.id
    @story=@story_comment.story
    if story_comment.save!
      redirect_to public_story_path(@story.id)
    else
      render "public/story/show"
    end 
  end 

  def destroy
    @story_comment=StoryComment.find(params[:id])
    @story=@story_comment.story
    if @story_comment.destroy
      redirect_to public_story_path(@story.id)
    else
      render "public/story/show"
    end 
  end 
end
