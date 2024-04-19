ActiveAdmin.register Film do
  permit_params :title, :description, :genre_id, :year, :image, :author_id

  index do
    selectable_column
    column :id
    column :title
    column :description
    column :genre
    column :year
    column "Image" do |film|
      if film.image.attached?
        image_tag film.image.variant(resize: '100x100')
      else
        "No Image"
      end
    end
    column :author
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :genre
      row :year
      row "Image" do |film|
        if film.image.attached?
          image_tag film.image.variant(resize: '300x300')
        else
          "No Image"
        end
      end
      row :author
    end
  end

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
