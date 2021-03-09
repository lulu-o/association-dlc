class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :active, :boolean
    add_column :users, :admin, :boolean
  end
end
