ActiveAdmin.register User do
  batch_action :set_users do |ids|
    redirect_to admin_mailer_path(user_ids: ids)
  end

  index do
    selectable_column
    id_column
    column :name
    column :no_of_article do |u|
      u.articles.count
    end
    column :created_at
    column :sex
    column :nationality
    column :residence
    actions
  end

  form do |f|
    f.inputs 'User Sign up' do
      f.input :name
      f.input :email
      f.input :sex
      f.input :nationality
      f.input :residence
      f.actions
    end
  end

  filter :name
  filter :articles_created_at, :as => :date_range

  show do
    attributes_table do
      row 'name' do
        resource.name
      end
      row 'email' do
        resource.email
      end
      row 'resister date' do
        resource.created_at
      end
      row 'sex' do
        resource.sex
      end
      row 'nationality' do
        resource.nationality
      end
      row 'residence' do
        resource.residence
      end
      row 'List of Articles' do
        Article.where(user_id: User.where(id: resource.id).all.pluck(:id)).all.pluck(:content)
      end
    end
  end
  permit_params :name, :email, :sex, :nationality, :residence
end
