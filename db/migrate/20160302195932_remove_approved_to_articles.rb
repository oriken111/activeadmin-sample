class RemoveApprovedToArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :approved, :string
  end
end
