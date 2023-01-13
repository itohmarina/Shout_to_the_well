class Admin::GenresController < ApplicationController

  def index
    @genres=Genre.all
  end

  def create
    @genre=Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end

  def update
    @genre=Genre.find(params[:id])

    if @genre.is_deleted == false
      @genre.update(is_deleted: true)
      redirect_to genres_path
    else
      @genre.update(is_deleted: false)
      redirect_to genres_path
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
