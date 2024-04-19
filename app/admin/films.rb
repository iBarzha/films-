ActiveAdmin.register Film do
  permit_params :title, :description, :genre_id, :year, :image

  filter :title
  filter :description
  filter :genre
  filter :year
  filter :image_filename, as: :string, label: 'Image Filename'

  controller do
    def scoped_collection
      Film.includes(:image_attachment)
    end
  end
end
