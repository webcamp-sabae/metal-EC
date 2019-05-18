class OthersaddressesController < ApplicationController

  def new
    @othersaddress = Othersaddress.new
    @othersaddresses = Othersaddress.all
  end

  def create
    @othersaddress = Othersaddress.new(othersaddress_params)
    @othersaddress.save
    redirect_to new_othersaddress_path
  end

  private
    def othersaddress_params
      params.require(:othersaddress).permit(:user_id, :familyname, :firstname, :kana_familyname, :kana_firstname, :telephone_number, :postal_code, :address)
    end


end
