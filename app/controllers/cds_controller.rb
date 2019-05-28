class CdsController < ApplicationController
  def show
  	@cd = Cd.find(params[:id])
    @artist = @cd.artist.id
    @songs = @cd.songs
    @cart = current_user.carts.new

    # stockの数量を反映させる
    @stock_array = []
  	@cd.stock.times do |amount|
  		if amount < 15
  			@stock_array << amount + 1
  		else
  			break
  		end
  	end
    # ===============
  end

  def index
    unless params[:q].present?
      @search = Cd.ransack
    else
      @search = Cd.ransack(
        single_album_name_cont_any:
        params[:q][:single_album_name_cont_any].split(/[\s|　]/)
      )
    end
    @cds = @search.result
    @q_sql = @search.result.to_sql
  end
end
