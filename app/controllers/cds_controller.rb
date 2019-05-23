class CdsController < ApplicationController
  def show
  	@cd = Cd.find(params[:id])
  end

  def index
  	@cds = Cd.all
  end
end
