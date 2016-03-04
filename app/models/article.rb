class Article < ActiveRecord::Base
  belongs_to :user
  scope :group_by_this_month,   -> { group("date_trunc('month', created_at) ") }
end
