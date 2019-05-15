class CreateOthersaddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :othersaddresses do |t|
      t.integer :user_id
      t.string :postal_code
      t.string :address
      t.timestamps
    end
  end
end
