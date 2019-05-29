 class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update, :destroy]

  #カート一覧表示
  def index
    @carts = current_user.carts
    @postage = 500
    @total_price = 0
  end

  #カートに商品を追加する
  def create
    cart = Cart.find_by(
      user_id: current_user.id,
      cd_id: cart_params[:cd_id]
    )

    if cart.present?
      # update
      # 既存のカートレコードに数量を追加
      cart.amount += cart_params[:amount].to_i
    else
      # create
      # 新規でレコードを作成
      cart = Cart.new(cart_params)
    end

    if cart.cd.stock.to_i > 0
      cart.save
      flash[:notice] = "カートに商品が追加されました"
      redirect_to carts_path
    else
      flash[:notice] = "品切れのため商品を追加できません。"
      render "cds/show"
    end
  end

#カート商品の数量変更
  def update
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
    if @cart.destroy
    flash[:notice] = "削除しました"
    redirect_to carts_path
    else
    falsh[:notice] = "削除できませんでした"
    redirect_to cart_path
    end
  end

  private

  def set_user
      @cart = Cart.find(params[:id])
    end

  def cart_params
    params.require(:cart).permit(:cd_id, :user_id, :amount)
  end

end
