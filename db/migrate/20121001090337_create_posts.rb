class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :admin
      t.integer :position
      t.string :title, :null => false
      t.string :tagline
      t.text :content, :null => false
      t.boolean :visible
      t.timestamps
    end
    add_index("posts", "admin_id")
  end
end
