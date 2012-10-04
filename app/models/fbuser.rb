class Fbuser < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  def self.from_omniauth(auth)
     create! do |fbuser|
        fbuser.provider = auth["provider"]
        fbuser.uid = auth["uid"]
        fbuser.name = auth["info"]["name"]
      end
  end
end
