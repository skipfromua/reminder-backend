# frozen_string_literal: true

module ControllerMacros
  def log_in(user)
    request.headers.merge!('Authorization': "Bearer #{user.generate_auth_token}")
  end
end
