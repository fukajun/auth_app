class User < ActiveRecord::Base
  has_many :authentications
  class << self

    def find_or_create_by_omniauth(auth)
      find_by_omniauth(auth) || create_with_omniauth(auth)
    end

    def find_by_omniauth(auth)
      authentication = Authentication.where(provider: auth['provider'], uid: auth['uid']).first
      authentication.user if authentication
    end

    def create_with_omniauth(auth)
      info = auth['info']
      user = nil
      User.transaction do
        user = User.create!(user_params(auth))
        user.authentications.create!(auth_params(auth))
      end
      user
    end

    private
    def user_params(hash)
      info = hash["info"]
      {
        "name" => info["name"]
      }
    end

    def auth_params(hash)
      info = hash["info"]
      credentials = hash["credentials"]
      {
        provider: hash["provider"],
        uid: hash["uid"],
        screen_name: info["nickname"],
        access_token: credentials["token"],
        secret: credentials["secret"],
        name: info["name"]
      }
    end
  end

end
