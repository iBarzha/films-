class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_film

  def create
    @comment = @film.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @film, notice: 'Comment was successfully created.'
    else
      redirect_to @film, alert: 'Failed to create comment.'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to @film, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_film
    @film = Film.find(params[:film_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
