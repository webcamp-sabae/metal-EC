class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :shipping_familyname
      t.string :shipping_firstname
      t.string :shipping_kana_familyname
      t.string :shipping_kana_firstname
      t.string :shipping_postal
      t.string :shipping_address
      t.string :shipping_telephone_number
      t.integer :payment
      t.integer :status
      t.inetger :postage
      t.timestamps
    end
  end
end
