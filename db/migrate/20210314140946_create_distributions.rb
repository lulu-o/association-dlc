class CreateDistributions < ActiveRecord::Migration[6.1]
  def change
    create_table :distributions do |t|
      t.date :date
      t.time :hour
      t.references :harvest, foreign_key: true
      t.timestamps
    end
  end
end
