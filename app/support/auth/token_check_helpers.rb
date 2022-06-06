# frozen_string_literal: true

module Auth::TokenCheckHelpers
  extend ActiveSupport::Concern

  TOKEN_TYPE = 'authentication'

  included do
    attr_reader :current_user

    def auth_token_absent?
      http_auth_header_content.nil?
    end

    def valid_auth_token?
      decoded_auth_token && decoded_auth_token[:token_type] == TOKEN_TYPE
    end

    # Based on the user id inside the token payload, find the user.
    def authenticate_user
      @current_user = warden.set_user(User.find(decoded_auth_token[:id]), store: false)
    end

    def decoded_auth_token
      @decoded_auth_token ||= Auth::JwtToken.decode(http_auth_header_content)
    end

    # JWT's are stored in the Authorization header using this format:
    # Bearer somerandomstring.encoded-payload.anotherrandomstring
    def http_auth_header_content
      return @http_auth_header_content if defined? @http_auth_header_content

      @http_auth_header_content = if request.headers['Authorization'].present?
                                    request.headers['Authorization'].split.last
                                  end
    end
  end
end
