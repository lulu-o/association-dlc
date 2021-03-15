class AddReferenceFromDistributionsToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :reference, index: true
    add_reference :distributions, :users, foreign_key: true
  end
end
