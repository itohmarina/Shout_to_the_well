class Public::GenresController < ApplicationController
  
  def show
    @genre = Genre.find(params[:id])
    @stories = @genre.stories.where(is_deleted: false, is_private: false)
  end 
  
end
