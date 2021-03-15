class ModifyDistributionsController < ActiveRecord::Migration[6.1]
  def change
    add_column :distributions, :baskets_number, :integer
    add_column :distributions, :description, :string
    add_column :distributions, :need_bag, :boolean, default: :false
    add_column :distributions, :need_cooler, :boolean, default: :false
    add_column :distributions, :informations, :string
    add_column :distributions, :address, :string
    add_column :distributions, :zipcode, :string
    add_column :distributions, :city, :string
    add_reference :users, :reference, index: true
  end
end
