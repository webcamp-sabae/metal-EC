class CreateOthersaddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :othersaddresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :familyname, null: false
      t.string :firstname, null: false
      t.string :kana_familyname, null: false
      t.string :kana_firstname, null: false
      t.string :telephone_number, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
