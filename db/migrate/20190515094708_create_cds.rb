class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
	  t.integer :artist_id
	  t.integer :label_id
	  t.integer :genre_id
	  t.datetime :release, null: false
	  t.integer :price, null: false
	  t.integer :stock, null: false
	  t.text :cd_image
	  t.string :single_album_name, null: false, index: true
      t.timestamps
    end
  end
  add_foreign_key: :cds, :artists
  add_foreign_key: :cds, :labels
  add_foreign_key: :cds, :genres
end
