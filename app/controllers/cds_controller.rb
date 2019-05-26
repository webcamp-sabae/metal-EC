class CdsController < ApplicationController
  def show
  	@cd = Cd.find(params[:id])
    @artist = Artist.find(params[:id])
    @songs = @cd.songs
    @cart = current_user.carts.new

    # stockの数量を反映させる
  	@cd.stock.times do |quantity|
  		if quantity < 15
  			 @stock_array << quantity + 1
  			else
  				break
  			end
  		end
    @stock_array = []
    # ===============
  end

  def index
  	@cds = Cd.all
  end
end