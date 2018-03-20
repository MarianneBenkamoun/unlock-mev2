class AddInfostoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :status, :string

  end
end
