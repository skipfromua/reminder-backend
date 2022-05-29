class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  def generate_auth_token
    payload = {
      id: id,
      email: email,
      token_type: Auth::TokenCheckHelpers::TOKEN_TYPE
    }

    Auth::JwtToken.encode(payload)
  end
end
