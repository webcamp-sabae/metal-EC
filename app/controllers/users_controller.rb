class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def show
  	@user = User.find(params[:id])
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
  	@user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destory

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
