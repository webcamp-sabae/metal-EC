class Admins::PurchasesController < Admins::AdminsController
  def index
    @purchases = Purchase.all
  end
end
