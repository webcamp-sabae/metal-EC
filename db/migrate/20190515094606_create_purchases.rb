class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :cd_id
      t.integer :receipt_id
      t.integer :purches_price
      t.timestamps
    end
  end
end
