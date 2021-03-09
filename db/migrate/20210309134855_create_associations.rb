class CreateAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :associations do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :city
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
