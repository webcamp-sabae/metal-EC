class CdsController < ApplicationController
  def show
  end

  def index
  	@cds = Cd.all
  end
end
