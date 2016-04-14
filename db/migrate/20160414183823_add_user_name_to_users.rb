class AddUserNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    remove_column :users, :email, :string
  end
end
