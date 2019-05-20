class ReceiptsController < ApplicationController

def new
  @receipt = Receipt.new
end

def create
   receipt = Receipt.new(receipt_params)
   receipt.save
end

  private
  def receipt_params
  params.require(:receipt).permit(:shipping_familyname, :shipping_firstname, :shipping_kana_familyname, :shipping_kana_firstname, :shipping_postal, :shipping_address, :shipping_telephone_number)
  end

end
