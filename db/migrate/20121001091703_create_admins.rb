class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.timestamps
    end
  end
end
