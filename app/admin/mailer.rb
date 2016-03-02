ActiveAdmin.register_page 'Mailer' do
  menu false
  # 5,6のmailerとformをインクルード
  include InfoMailer
  include InfoForm

  content do
    panel '選択したユーザー' do
      render 'admin/user' # 3のviewをrender
    end

    panel 'メール作成' do
      render 'admin/form' # 4のviewをrender
    end
  end

  controller do
    def index
      # redirect
      if params[:user_ids].blank? || params[:user_ids].empty?
        redirect_to admin_users_path, notice: 'ユーザーを選択して下さい'
      else
        @info_form = InfoForm.new(user_ids: params[:user_ids])
      end
    end

    def create
      @info_form = InfoForm.new(info_form_params)
      if @info_form.valid?
        @info_form.deliver_all
        redirect_to admin_users_path, notice: 'メール送信成功'
      else
        redirect_to admin_users_path, notice: 'メール送信失敗'
      end
    end

    def info_form_params
      params.require(:info_form).permit(:to, :cc, :bcc, :subject, :body)
    end
  end
end
