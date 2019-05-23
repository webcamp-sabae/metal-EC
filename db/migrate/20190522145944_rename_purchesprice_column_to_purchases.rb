class RenamePurchespriceColumnToPurchases < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchases, :purches_price, :purchase_price
  end
end
