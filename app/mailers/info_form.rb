class InfoForm
  include ActiveModel::Model
  extend ActiveSupport::Concern

  attr_accessor :user_ids, :cc, :bcc, :subject, :body

  validates :subject, presence: true, length: { maximum: 10_000 }
  validates :body, presence: true, length: { maximum: 10_000 }

  def users
    @users ||= User.where(id: user_ids)
  end

  def deliver_all
    users.each do |user|
      InfoMailer.send_customer(self, user).deliver_now
    end
  end
end
