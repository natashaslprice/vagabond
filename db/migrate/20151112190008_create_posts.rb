class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :city

      t.timestamps null: false
      t.belongs_to :user
    end
  end
end
