class CreateArticleHashes < ActiveRecord::Migration[6.0]
  def change
    create_table :article_hashes do |t|
      t.references :article,        foreign_key: true
      t.references :hashtag,        foreign_key: true
      t.timestamps
    end
  end
end
