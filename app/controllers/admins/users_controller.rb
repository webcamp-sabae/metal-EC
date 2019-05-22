class Admins::UsersController < Admins::AdminsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @receipts = Receipt.where(user_id: @user)
  end

  def edit
  end

  def update
      respond_to do |format|
        @user.namespace(self.class.to_s)
        if @user.update(user_params)
          format.html {
            redirect_to admins_user_path(@user),
            notice: 'User was successfully updated.'
          }
          # format.json {
          #   render :show, status: :ok, location: @user
          # }
        else
          format.html {
            redirect_to admins_user_path(@user),
            notice: @user.erorrs.full_messages
          }
          # format.json {
          #   render json: @user.errors, status: :unprocessable_entity
          # }
        end
    end
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

    def user_params
      params.require(:user).permit(
        :familyname,
        :firstname,
        :kana_familyname,
        :kana_firstname,
        :postal_code,
        :address,
        :telephone_number,
        :email
      )
    end

end
