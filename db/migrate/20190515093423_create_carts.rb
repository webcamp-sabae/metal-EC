class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :cd, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
