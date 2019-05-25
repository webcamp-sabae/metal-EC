class Admins::PurchasesController < Admins::AdminsController

  def index
    @term = Purchase.ransack(params[:q])
    @purchases = @term.result
    @total_price = total_price_by(@purchases)
  end

  private

    def total_price_by(purchases)
      purchases.map(&:total_price).sum
    end
end
