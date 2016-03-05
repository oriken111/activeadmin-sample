class Article < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, inclusion: { in: %w(evernote.com) }
end
