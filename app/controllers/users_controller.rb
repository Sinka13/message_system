class UsersController < ApplicationController
  layout 'front'
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_redirect_path, only: [:edit, :update]


  def index
    @users = User.where.not(id: current_user.id)
    @chats = Chat.involving(current_user)
  end

  def edit
  end

  def update
    redirect_back fallback_location: @redirect_path, notice: "Info updated" if @user.update_attributes(user_params)
  end

  def destroy
    redirect_back fallback_location: root_path, notice: "User deleted" if @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:username,:password,:email,:password_confirmation).reject{|_, v| v.blank?}
  end

  def set_user
    @user = current_user.is_admin? ? User.find_by_id(params[:id]) : current_user
  end

  def set_redirect_path
    @redirect_path = current_user.is_admin? ? admin_path : root_path
  end
end
