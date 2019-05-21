class RemoveCdImageFromCds < ActiveRecord::Migration[5.2]
  def change
    remove_column :cds, :cd_image, :text
  end
end
