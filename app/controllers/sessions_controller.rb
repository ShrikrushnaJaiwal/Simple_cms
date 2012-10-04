class SessionsController < ApplicationController

 def create 
	auth = request.env["omniauth.auth"]
 	fbuser = Fbuser.find_by_provider_and_uid(auth["provider"],auth["uid"]) || Fbuser.from_omniauth(auth)
 	session[:fbuser_id] = fbuser.id
  	redirect_to root_url
       
 end

 def destroy
        session[:fbuser_id] = nil
        redirect_to root_url
 end
end
