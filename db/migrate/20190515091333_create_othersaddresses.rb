class CreateOthersaddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :othersaddresses do |t|
      t.integer :user_id
      t.string :postal_code, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
