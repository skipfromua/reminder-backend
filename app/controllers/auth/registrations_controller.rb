class Auth::RegistrationsController < DeviseController
  skip_before_action :preflight_request, only: :create

  def create
    User.create!(permitted_params)
  end

  private

  def permitted_params
    params.permit(:email, :password, :password_confirmation)
  end
end
