class CdsController < ApplicationController
  def show
  	@cd = Cd.find(params[:id])
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
