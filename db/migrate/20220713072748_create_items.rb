class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :brand
      t.integer :amount_in_stock
      t.boolean :availability

      t.timestamps
    end
  end
end
