class FilmsByAuthorController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @films = Film.where(author_id: params[:author_id])
  end
end