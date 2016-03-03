ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
# or
index do
  selectable_column
  id_column
  column :user
  column :content
  column :approved
  column :created_at
  actions
end

  form do |f|
    f.inputs 'Resister Article' do
      f.input :content
      f.input :approved
      f.input :user do |u|
        u.name
      end
      actions
    end
  end
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  filter :user
  filter :article_id

  permit_params :content, :approved, :user_id

end
