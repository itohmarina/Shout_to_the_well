class Admin::CommentsController < ApplicationController

  def index
    @comments=Comment.all
    @comment=Comment.new
  end

  def create
    @comment=Comment.new(comment_params)
    if @comment.save
      redirect_to admin_comments_path
    else
      render "admin/comments/index"
    end
  end


  def update
    @comment= Comment.find(params[:id])

    if @comment.is_deleted==false
      @comment.update(is_deleted: true)

    else
      @comment.update(is_deleted: false)
    end
    redirect_to admin_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end