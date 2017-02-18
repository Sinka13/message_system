class UsersController < ApplicationController
  layout 'front'
  def index
    @users = User.all#where.not(id: current_user.id)
    @chats = current_user.chats
  end

  def edit
    @user = current_user
  end

  def update
    params = user_params.reject{|_, v| v.blank?}
    byebug
    redirect_back fallback_location: root_path if current_user.update_attributes(params)
  end

  private
  def user_params
    params.require(:user).permit(:username,:password,:email,:password_confirmation)
  end
end
