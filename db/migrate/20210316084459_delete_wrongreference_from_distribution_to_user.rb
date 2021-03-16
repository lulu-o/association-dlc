class DeleteWrongreferenceFromDistributionToUser < ActiveRecord::Migration[6.1]
  def change
    remove_reference :distributions, :users, foreign_key: true
    add_reference :distributions, :user, foreign_key: true
  end
end
