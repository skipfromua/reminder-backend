class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :events

  def generate_auth_token
    payload = {
      id:,
      email:,
      token_type: Auth::TokenCheckHelpers::TOKEN_TYPE
    }

    Auth::JwtToken.encode(payload)
  end
end
