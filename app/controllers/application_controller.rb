class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  protected
  def confirm_logged_in
     unless session[:user_id]
       flash[:notice] = "Please log in ."
       redirect_to(:controller =>'access',:action => 'login')
       return false
     else
       return true
     end
  end
   
    private

  def current_user
      @current_user ||= Fbuser.find(session[:fbuser_id]) if session[:fbuser_id]
  end


end
