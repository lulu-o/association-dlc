class AddHourToHarvest < ActiveRecord::Migration[6.1]
  def change
    add_column :harvests, :hour, :time
  end
end
