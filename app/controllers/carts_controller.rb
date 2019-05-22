class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = Cart.all.includes(:cd,:user)
    @postage = 500
    @cds = Cd.all
  end

  def create
   @cart = Cart.new(cart_params)
   @cart.save
   redirect_to carts_path
  end

  def method

  end

  def update
      @cart = Cart.find(params[:id])
    if params[:cart][:amount].to_i <= @cart.cd.stock
      @cart.update(cart_params)
      flash[:notice] = "更新しました。"
      redirect_to carts_path
    else
      flash[:notice] = "購入希望数の在庫がないため更新に失敗しました"
      redirect_to carts_path
    end
  end

  def delete
    @cart = Cart.find(params[:id])
    if @cart.destroy
    flash[:notice] = "削除しました"
    redirect_to carts_path
    else
    falsh[:notice] = "更新に失敗しました"
    redirect_to cart_path
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:cd_id, :user_id, :amount)
  end
end
