class CreateHarvests < ActiveRecord::Migration[6.1]
  def change
    create_table :harvests do |t|
      t.date :date
      t.integer :harvesters_number
      t.references :association, foreign_key: true
      t.references :partner, foreign_key: true
      t.timestamps
    end
  end
end
