class OthersaddressesController < ApplicationController



  def new
    @othersaddress = Othersaddress.new
  end

  def create
    @othersaddress = Othersaddress.new(othersaddress_params)
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
    params.require(:othersaddress).permit(:user_id,:familyname, :firstname, :kana_familyname, :kana_firstname, :telephone_number, :postal_code, :address)
  end
end
