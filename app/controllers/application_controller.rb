class ApplicationController < ActionController::API
  include Auth::TokenCheckHelpers
  include ActionController::MimeResponds

  prepend_before_action :preflight_request

  def preflight_request
    # Check to make sure the token is valid (exists & not expired)
    raise ::Errors::Api::InvalidTokenError unless valid_auth_token?

    authenticate_user
  end
end
