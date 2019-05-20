class Admins::AdminsController < ApplicationController
  layout "admins"

  def index
    @receipts = Receipt.all
  end

end
