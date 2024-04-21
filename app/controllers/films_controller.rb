class FilmsController < ApplicationController

  def show
    @film = Film.find(params[:id])
  end
  def index
    @q = Film.ransack(params[:q])
    @films = @q.result(distinct: true)
    @films = @films.joins(:image_attachment).where('active_storage_attachments.filename LIKE ?', "%#{params[:q][:image_filename_cont]}%")

    if params[:q][:image_attachment_filename].present?
      @films = @films.joins(:image_attachment).where('active_storage_attachments.filename = ?', params[:q][:image_attachment_filename])
    end

    if params[:q][:image_attachment_content_type].present?
      @films = @films.joins(:image_attachment).where('active_storage_attachments.content_type = ?', params[:q][:image_attachment_content_type])
    end
  end
end