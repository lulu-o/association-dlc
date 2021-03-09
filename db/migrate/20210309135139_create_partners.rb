class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :city
      t.float :latitude
      t.float :longitude
      t.integer :harvesters_number
      t.references :brand, foreign_key: true
      t.timestamps
    end
  end
end
