class AddRetailstoreToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :retailstore, foreign_key: true
  end
end
