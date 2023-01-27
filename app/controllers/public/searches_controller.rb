class Public::SearchesController < ApplicationController

  #検索結果を表示
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Story"
      @stories = Story.looks(params[:search], params[:word]).order(id: "DESC")
      if params[:genre].present?
        @genre = Genre.find(params[:genre])
        @stories = @stories.where(genre_id: @genre.id).order(id: "DESC")
      end
    elsif @range == "User"
      @users = User.looks(params[:search], params[:word]).order(id: "DESC")
    else
      @groups = Group.looks(params[:search], params[:word]).order(id: "DESC")
    end

  end



end
