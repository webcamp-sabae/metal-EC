class Admins::AdminsController < ApplicationController
  layout "admins"

  def index
    @receipts = Receipt.undispatched
  end

end
