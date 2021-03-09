class CreateAssociationPartners < ActiveRecord::Migration[6.1]
  def change
    create_table :association_partners do |t|
      t.references :association, foreign_key: true
      t.references :partner, foreign_key: true
      t.timestamps
    end
  end
end
