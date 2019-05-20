class OthersaddressesController < ApplicationController



  def new
    @othersaddress = Othersaddress.new
  end

  def create
    @othersaddress = Othersaddress.new(othersaddress_params)
    @othersaddress.user_id = 1
    if @othersaddress.save
    redirecit_to new_receipt_path
    else
    render :new
    end
  end

  def update
  end



  private

  def othersaddress_params
    params.require(:othersaddress).permit(:user_id,:familyname, :firstname, :kana_familyname, :kana_firstname, :first_postal_code, :last_postal_code, :statu_address, :city_address, :street_address, :telephone_number1, :telephone_number2, :telephone_number3)
  end
end
