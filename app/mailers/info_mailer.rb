class InfoMailer < ActionMailer::Base
  extend ActiveSupport::Concern

  default from: 'hoge@gmail.com'

  def send_customer(info_form, user)
    @info_form = info_form
    @user = user
    mail(
         to: @user.email,
         cc: @info_form.cc,
         bcc: @info_form.bcc,
         subject: @info_form.subject
         body: @info_form.body
         )
  end


end
