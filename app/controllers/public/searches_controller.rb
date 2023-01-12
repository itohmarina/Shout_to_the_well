class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  #検索結果を表示
  def search
    @range = params[:range]
    @genre = params[:genre]

    if @range == "Story"
      @stories = Story.looks(params[:search], params[:word])
      if @genre.present?
        @stories = @stories.where(genre_id: @genre.to_i)
      end
    elsif @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @groups = Group.looks(params[:search], params[:word])
    end


  end



end
