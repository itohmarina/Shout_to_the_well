class Public::StoriesController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  
  def show
    @story=Story.find(params[:id])
    @user=User.find(@story.user_id)
    @story_comments=@story.story_comments.page(params[:page])
    @comments=Comment.all
    @story_comment=StoryComment.new
  end

  def new
    @story=Story.new
    @user=current_user
    @genres=Genre.all
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    @user = current_user
    if @story.save!
      redirect_to public_story_path(@story.id), notice: "ストーリーを投稿しました"
    else
      @genres = Genre.all
      render 'public/stories/new'
    end
  end

  def edit
    @story = Story.find(params[:id])
    @user = current_user
    @genres = Genre.all
    is_matching_login_user
  end

  def update
    @story = Story.find(params[:id])
    is_matching_login_user

    if @story.update(story_params)
      redirect_to public_story_path(@story.id), notice: "ストーリーを更新しました"
    else
      render 'public/stories/edit'
    end
  end

  def destroy
    @story = Story.find(params[:id])
    is_matching_login_user

    if @story.destroy
      flash[:notice]="ストーリーを削除しました"
      redirect_to users_my_page_path
    else
      @user = current_user
      render "public/users/show"
    end
  end

  private

  def story_params
    params.require(:story).permit(:genre_id, :title, :body, :is_private)
  end

  def is_matching_login_user
    user_id=@story.user_id.to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to users_my_page_path(login_user_id)
    end
  end

end
