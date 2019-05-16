class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :familyname, :string
  	add_column :users, :firstname, :string
  	add_column :users, :kana_familyname, :string
  	add_column :users, :kana_firstname, :string
  	add_column :users, :postal_code, :string
  	add_column :users, :telephone_number, :string
  	add_column :users, :deleted_at, :datetime
  	change_column :users, :email, :string, :where => 'deleted_at IS NULL', :default => ""
  end
end
