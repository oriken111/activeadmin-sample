ActiveAdmin.register User do

  batch_action :set_users do |ids|
    redirect_to admin_mailer_path(user_ids: ids)
  end

 # 全選択したいので、ページングしない
end
