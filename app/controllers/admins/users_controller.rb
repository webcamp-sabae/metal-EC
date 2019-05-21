class Admins::UsersController < Admins::AdminsController
  before_action :set_user, only: [:show, :edit, :destroy]

  def index
    @users = User.all
  end

  def show
    @receipts = Receipt.where(user_id: @user)
  end

  def edit
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admins_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
