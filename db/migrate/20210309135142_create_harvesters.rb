class CreateHarvesters < ActiveRecord::Migration[6.1]
  def change
    create_table :harvesters do |t|
      t.references :user, foreign_key: true
      t.references :harvest, foreign_key: true
      t.timestamps
    end
  end
end
