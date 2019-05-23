class CartsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @carts = Cart.where(user_id: current_user.id)
    @postage = 500
  end

  def create
   @cart = Cart.new(cart_params)
   @cart.save
   redirect_to carts_path
  end

  def update
      @cart = Cart.find(params[:id])
    if params[:cart][:amount].to_i <= @cart.cd.stock
      @cart.update(cart_params)
      flash[:notice] = "購入数量を更新しました"
      redirect_to carts_path
    else
      flash.now[:notice] = "購入希望数の在庫がないため更新に失敗しました"
      redirect_to carts_path
    end
  end

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
