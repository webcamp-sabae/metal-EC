class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
	  t.integer :artist_id, foreign_key: true
	  t.integer :label_id, foreign_key: true
	  t.integer :genre_id, foreign_key: true
	  t.datetime :release
	  t.integer :price
	  t.integer :stock
	  t.text :cd_image
	  t.string :single_album_name
      t.timestamps
    end
  end
end
