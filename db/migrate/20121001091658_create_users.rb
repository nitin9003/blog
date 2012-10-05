class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.boolean :sex
      t.date :dob
      t.string :email, :null => false
      t.string :hashed_password, :null => false
      t.string :salt
      t.boolean :visible
      t.text :about_user
      t.timestamps
    end
  end
end
