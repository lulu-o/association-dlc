class CreateDistributors < ActiveRecord::Migration[6.1]
  def change
    create_table :distributors do |t|
      t.references :distribution, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :distribution_place, default: false
      t.timestamps
    end
  end
end
