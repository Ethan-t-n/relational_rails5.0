class CreateRetailstore < ActiveRecord::Migration[5.2]
  def change
    create_table :retailstores do |t|
      t.string :name
      t.string :location
      t.integer :total_items_in_stock
      t.boolean :open_for_day

      t.timestamps
    end
  end
end
