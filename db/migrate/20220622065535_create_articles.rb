class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, limit: 10
      t.text :content, null: false
      t.string :img
      t.timestamps
    end
  end
end
