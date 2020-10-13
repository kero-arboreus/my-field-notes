class AddHashbodyToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :hashbody, :string
  end
end
