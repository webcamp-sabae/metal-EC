class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
    @purchase_group = @purchases.group_by { |item| item.receipt_id }
  end
end
