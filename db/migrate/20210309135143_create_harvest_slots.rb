class CreateHarvestSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :harvest_slots do |t|
      t.integer :day_of_the_week
      t.time :hour
      t.references :partner, foreign_key: true
      t.timestamps
    end
  end
end
