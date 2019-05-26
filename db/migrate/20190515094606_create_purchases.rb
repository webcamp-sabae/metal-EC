class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :cd,      foreign_key: true, null: false
      t.references :receipt, foreign_key: true, null: false
      t.integer :purchase_price, null: false
      t.timestamps
    end
  end
end
