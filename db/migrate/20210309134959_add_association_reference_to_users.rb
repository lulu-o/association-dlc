class AddAssociationReferenceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :association, null: false, foreign_key: true
  end
end
