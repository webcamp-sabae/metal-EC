class ReceiptsController < ApplicationController

  def new
    @othersaddresses = Othersaddress.new
  end

  def create

  end

  private
  def receipt_params
  params.require(:receipt).permit(:)
  end

end
