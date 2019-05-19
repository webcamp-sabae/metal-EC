class UsersController < ApplicationController
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
  end

  def update
  	
  end
  def destory
  	
  end
  private

  def user_params
  	params.require(:user).pamit(:familyname, :firstname, :kana_familyname, :kana_firstname, :first_postal_code, :last_postal_code, :statu_address, :city_address, :street_address, :telephone_number1, :telephone_number2, :telephone_number3)
  end
end
