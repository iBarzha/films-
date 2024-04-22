class FilmsController < ApplicationController
  def show
    @film = Film.find(params[:id])
  end

  def index
    @q = Film.ransack(params[:q])

    if params[:q].present?
      @films = @q.result(distinct: true)

      if params[:q][:image_filename_cont].present?
        @films = @films.joins(:image_attachment).where('active_storage_attachments.filename LIKE ?', "%#{params[:q][:image_filename_cont]}%")
      end

      if params[:q][:image_attachment_filename].present?
        @films = @films.joins(:image_attachment).where('active_storage_attachments.filename = ?', params[:q][:image_attachment_filename])
      end

      if params[:q][:image_attachment_content_type].present?
        @films = @films.joins(:image_attachment).where('active_storage_attachments.content_type = ?', params[:q][:image_attachment_content_type])
      end
    else
      @films = Film.all
    end
  end
end
