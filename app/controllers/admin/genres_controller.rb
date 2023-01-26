class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    @genre = Genre.new
    redirect_to admin_genres_path
  end

  def update
    @genre=Genre.find(params[:id])

    if @genre.is_deleted == false
      @genre.update(is_deleted: true)
      @genre = Genre.new
      redirect_to admin_genres_path
    else
      @genre.update(is_deleted: false)
      @genre = Genre.new
      redirect_to admin_genres_path
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
