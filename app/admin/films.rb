ActiveAdmin.register Film do
  permit_params :title, :description, :genre_id, :year, :image, :author

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :genre
      f.input :year
      f.input :image, as: :file
      f.input :author
    end
    f.actions
  end

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
