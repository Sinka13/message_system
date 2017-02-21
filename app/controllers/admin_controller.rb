class AdminController < ApplicationController
  layout 'admin'
  before_action :is_admin?

  def index
    @users = User.all.order(last_sign_in_at: :desc).page params[:page]
  end

  private
  def is_admin?
    redirect_to root_path unless current_user.is_admin?
  end
end
