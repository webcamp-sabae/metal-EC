class OthersaddressesController < ApplicationController



  def new
    @othersaddress = Othersaddress.new
  end

  def create
    othersaddress = Othersaddress.new(othersaddress_params)
    othersaddress.save
    redirecit_to new_receipt_path
  end

  def update
  end



  private

  def othersaddress_params
    params.require(:othersaddress).permit(:familyname, :firstname, :kana_familyname, :kana_firstname, :telephone_number, :postal_code, :first_address, :last_address, :address)
  end
end
