class Public::GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    stories = @genre.stories.where(is_deleted: false, is_private: false)
    @stories = stories.select('stories.*', 'count(favorites.id) AS favs').left_joins(:favorites).group('stories.id').order('favs desc').page(params[:page])
  end

end
