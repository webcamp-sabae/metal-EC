class Admins::ReceiptsController < Admins::AdminsController
  before_action :set_receipt

  def update
    respond_to do |format|
      if @receipt.update(status: '発送済')
        format.html { redirect_to admins_root_path,
           notice: 'receipt was successfully updated.' }
        # format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { redirect_to admins_root_path }
        # format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to admins_root_path, notice: 'receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

end
