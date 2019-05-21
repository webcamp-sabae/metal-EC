class Admins::UsersController < Admins::AdminsController
  before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
