ActiveAdmin.register Film do
  permit_params :title, :description, :genre, :year, :image

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :genre
      f.input :year
      f.input :image, as: :file
    end
    f.actions
  end
end