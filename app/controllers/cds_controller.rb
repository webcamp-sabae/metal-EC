class CdsController < ApplicationController
  def show
  	@cd = Cd.find(params[:id])
  	@song = Song.find(params[:id])

  	@stock_array = []
  	@cd.stock.times do |quantity|
  		if quantity < 15
  			 @stock_array << quantity + 1
  			else
  				break
  			end
  		end
  end

  def index
  	@cds = Cd.all
  end
end