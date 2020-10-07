class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title,              null: false
      t.date :date,                 null: false
      t.integer :time_id
      t.integer :prefecture_id,     null: false 
      t.integer :category_id,       null: false
      t.text :text,                 null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :parking
      t.float :crowd
      t.float :toiket
      t.timestamps
    end
  end
end
