class FilmsByGenreController < ApplicationController
  def index
    @genre = Genre.find(params[:genre_id])
    @films = @genre.films
  end
end
