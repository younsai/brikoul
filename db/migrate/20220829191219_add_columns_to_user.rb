class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthdate, :date
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :cnie, :string
    add_column :users, :resume, :text
  end
end
