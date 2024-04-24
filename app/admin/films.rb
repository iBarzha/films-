ActiveAdmin.register Film do
  permit_params :title, :description, :year, :image, :author_id, genre_ids: []

  index do
    selectable_column
    column :id
    column :title
    column :description
    column "Genres" do |film|
      film.genres.map(&:name).join(', ')
    end
    column :year
    column :author
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row "Genres" do |film|
        film.genres.map(&:name).join(', ')
      end
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
      f.input :genres, as: :check_boxes
      f.input :year
      f.input :image, as: :file
      f.input :author
    end
    f.actions
  end

  filter :title
  filter :description
  filter :year
  filter :image_filename, as: :string, label: 'Image Filename'

  filter :genre_id,
         as: :select,
         label: 'Genre',
         collection: Genre.pluck(:name, :id),
         multiple: true,
         input_html: { name: 'q[genre_id_in]' }

  controller do
    def scoped_collection
      Film.includes(:image_attachment, :genres)
    end
  end
end
