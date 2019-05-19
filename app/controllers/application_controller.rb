class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:familyname, :firstname, :kana_familyname, :kana_firstname, :first_postal_code, :last_postal_code, :statu_address, :city_address, :street_address, :telephone_number1, :telephone_number2, :telephone_number3])
	end

	 # ログイン後に遷移するページ
  def after_sign_in_path_for(resource)
      user_path(resource)
  end
     # ログアウト後に遷移するページ
  def after_sign_out_path_for(resource_or_root)
  	root_path
  end
end
