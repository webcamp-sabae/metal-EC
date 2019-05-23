class ReceiptsController < ApplicationController

def new
  @receipt = Receipt.new
  @othersaddress = Othersaddress.all
  # @receipt.purchases.build
end

def create
   @receipt = Receipt.new(receipt_params)
   @receipt.save
    logger.debug @receipt.errors.to_yaml
   redirect_to thanks_path
end

  private
  def receipt_params
  params.require(:receipt).permit(
        :shipping_familyname,
        :shipping_firstname,
        :shipping_kana_familyname,
        :shipping_kana_firstname,
        :shipping_postal,
        :shipping_address,
        :shipping_telephone_number,
        :user_id,
        :payment,
        :status,
        :postage,
        addresses_attributes: [:id, :cd_id, :purchase_price]
        )
  end

end
