class Admins::AdminsController < ApplicationController
  layout "admins"

  def index
    @receipts = Receipt.all
    @receipts = @receipts.select do |receipt|
      receipt.status == '未発送'
    end
  end

end
