class Article < ActiveRecord::Base
  belongs_to :user
  scope :group_by_this_month,   -> { group("date_trunc('month', created_at) ") }
  validates :content, presence: true, inclusion: { in: %w(evernote.com) }
end
