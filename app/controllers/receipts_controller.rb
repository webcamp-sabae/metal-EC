class ReceiptsController < ApplicationController

def new
  @receipt = Receipt.new
  @othersaddress = Othersaddress.where(user_id: current_user.id)
  @addresses = []

  @othersaddress.each do |value|
  @addresses.push(value.address)
  end
  @addresses << (User.first.address)
end

def create
   receipt = Receipt.new(receipt_params)
   if receipt.save
     flash[:ntice] = "購入が完了しました"
     redirect_to thanks_path
   else
    flash[:notice] = "もう一度お試しください"
    redirect_to new_receipt_path
    end
end

  private
  def receipt_params
  params.require(:receipt).permit(:shipping_familyname, :shipping_firstname, :shipping_kana_familyname, :shipping_kana_firstname, :shipping_postal, :shipping_address, :shipping_telephone_number)
  end

end
