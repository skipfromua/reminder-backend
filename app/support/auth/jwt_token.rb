# frozen_string_literal: true

# We could just return the payload as a hash, but having keys with indifferent access
# is always nice, plus we get an expired? method that will be useful later
DecodedAuthToken = Class.new ActiveSupport::HashWithIndifferentAccess

class Auth::JwtToken
  def self.encode(payload, exp = 240.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def self.decode(token)
    payload = JWT.decode(token, Rails.application.secret_key_base).first
    DecodedAuthToken.new(payload)
  rescue JWT::ExpiredSignature, JWT::DecodeError
    raise ::Errors::Api::InvalidTokenError
  end
end
