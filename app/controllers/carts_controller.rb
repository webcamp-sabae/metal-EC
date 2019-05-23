class CartsController < ApplicationController
  # before_action :authenticate_user!
  #カート一覧表示
  def index
    @carts = Cart.all
    # @carts = Cart.where(user_id: current_user.id)
    @postage = 500
    @total_price = 0
  end

  def create
   @cart = Cart.new(cart_params)
   if @cart.cd.stock.to_i > 0
   @cart.save
   flash[:notice] = "カートに商品が追加されました"
   redirect_to carts_path
  end

#カート商品の数量変更
  def update
      @cart = Cart.find(params[:id])
    if params[:cart][:amount].to_i <= @cart.cd.stock
      @cart.update(cart_params)
      flash[:notice] = "購入数量を変更しました"
      redirect_to carts_path
    else
      flash[:notice] = "購入希望数の在庫がないため変更に失敗しました"
      redirect_to carts_path
    end
  end

 #カート商品の削除
  def destroy
    @cart = Cart.find(params[:id])
    if @cart.destroy
    flash[:notice] = "削除しました"
    redirect_to carts_path
    else
    falsh[:notice] = "削除できませんでした"
    redirect_to cart_path
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:cd_id, :user_id, :amount)
  end

end
