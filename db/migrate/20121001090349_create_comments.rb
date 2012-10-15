class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
   #   t.references :user
      t.integer :position
      t.string :title, :null => false
      t.text :content, :null => false
      t.string :name
      t.string :email, :null => false
      t.boolean :visible
      t.timestamps
    end
    add_index("comments", "post_id")
  #  add_index("comments", "user_id") 
  end
end
