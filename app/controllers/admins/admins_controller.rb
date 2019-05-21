class Admins::AdminsController < ApplicationController
  layout "admins"

  def index
    @receipts = Receipt.status_select('未発送')
  end

end
