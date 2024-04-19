ActiveAdmin.register Author do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name

  filter :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
  
end
