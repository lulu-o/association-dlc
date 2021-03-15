class DropFuckingDistributorTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :distributors
  end
end
