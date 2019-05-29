class ReceiptsController < ApplicationController

  def new
     @receipt = Receipt.new
     @othersaddress = Othersaddress.all
     @addresspage = current_user.othersaddresses.page(params[:page]).reverse_order.per(1)
     @current_user = current_user

     @per_subtotal = []
     @current_user.carts.each do |cart|
     @per_subtotal << ( cart.cd.price * cart.amount )
      end
     @postage = 500
     @subtotal = @per_subtotal.sum
     @totalprice = @subtotal + @postage
  end


def create
    @receipt = Receipt.new(receipt_params)
  #Viewで登録済み住所を選択した場合current_user.id: 0が送られ、その他の住所ではaddress.id > 0が送られるのでの条件分岐により振り分けられる
  if params[:ship][:shipping_address].to_i != 0
    @address = Othersaddress.find(params[:ship][:shipping_address])
    @receipt.shipping_familyname = @address.familyname
    @receipt.shipping_firstname = @address.firstname
    @receipt.shipping_kana_familyname = @address.kana_familyname
    @receipt.shipping_kana_firstname = @address.kana_firstname
    @receipt.shipping_postal = @address.postal_code
    @receipt.shipping_address = @address.address
    @receipt.shipping_telephone_number = @address.telephone_number
  else
    @receipt.shipping_familyname = current_user.familyname
    @receipt.shipping_firstname = current_user.firstname
    @receipt.shipping_kana_familyname = current_user.kana_familyname
    @receipt.shipping_kana_firstname = current_user.kana_firstname
    @receipt.shipping_postal = current_user.postal_code
    @receipt.shipping_address = current_user.address
    @receipt.shipping_telephone_number = current_user.telephone_number
  end
   @receipt.save

   carts = current_user.carts

   carts.each do |cart|
     Purchase.create(
      receipt_id: @receipt.id,
      cd_id: cart.cd_id,
      amount: cart.amount,
      purchase_price: cart.cd.price
    )

     cart.cd.decrement!(:stock, cart.amount )

    end

  carts.destroy_all

  redirect_to thanks_path
end


  private


    def receipt_params
      params.require(:receipt).permit(
           :user_id,
           :payment,
           :status,
           :postage
           )
    end

end
