class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: :create
  def new
    super
  end

  def create
    if current_user&.is_admin
      redirect_to admin_path, notice: "User created" if User.create!(user_params)
    else
      super
    end
  end

  def update
    super
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :firstname, :lastname, :password, :password_confirmation)
  end
end
