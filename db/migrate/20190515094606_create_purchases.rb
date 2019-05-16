class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :cd,      foreign_key: true
      t.references :receipt, foreign_key: true
      t.integer :purches_price, null: false
      t.timestamps
    end
  end
end
