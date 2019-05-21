class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def create
   cd = Cd.find(params[:id])
   @cart = Cart.new
   @cart.save
  end

  def delete
    @cart = Cart.find(params[:id])
    if @cart.destroy
    flash[:notice] = "削除しました"
    redirect_to carts_path
    else
    falsh[:notice] = "更新に失敗しました"
    redirect_to carts_path
    end
  end

  def update

  end



  private
  def cart_params
    params.require(:cart).permit(:cd_id, :user_id, :amount)
  end
end
