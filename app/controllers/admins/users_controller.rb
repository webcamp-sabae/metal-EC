# class Admins::UsersController < ApplicationController
# layout "admins"
# AdminsControllerを継承するように変更
class Admins::UsersController < Admins::AdminsController

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end
end
