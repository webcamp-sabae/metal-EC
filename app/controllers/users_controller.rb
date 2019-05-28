class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :edit, :destroy]

  def show
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to user_path(current_user.id)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
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

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :familyname,
        :firstname,
        :kana_familyname,
        :kana_firstname,
        :first_postal_code,
        :last_postal_code,
        :statu_address,
        :city_address,
        :street_address,
        :telephone_number1,
        :telephone_number2,
        :telephone_number3
        )
    end
end
