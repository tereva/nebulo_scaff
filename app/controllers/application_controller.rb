class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #session :session_key => '_nebulo_session_id'

  helper_method :admin?


	protected

	def admin?
	session[:password] == 'petitflocon'
	end

	def authorize
	  unless admin?
	    flash[:error] = "unauthorized access"
	    redirect_to login_path
	    false
	  end
	end


end
