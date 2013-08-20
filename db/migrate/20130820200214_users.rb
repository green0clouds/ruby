class Users < ActiveRecord::Migration
  def change
  add_column :users, :password, :string 
     add_column :users, :encripted_password, :string 
add_column :users, :remember_me, :string
  end
end
