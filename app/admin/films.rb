ActiveAdmin.register Film do
  permit_params :title, :description, :year, :image

  filter :title_cont, label: 'Title'
  filter :description_cont, label: 'Description'
  filter :year_cont, label: 'Year'

end