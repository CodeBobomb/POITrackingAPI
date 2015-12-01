class ApplicationController < ActionController::API
	before_action :destroy_session

	USER_NOT_FOUND = "User was not found."
	MISSING_PARAMS = "Missing params."
	INVALID_TOKEN = "Invalid token."
	EXPIRED_TOKEN = "Token expired"

  	def destroy_session
    	request.session_options[:skip] = true
  	end

  	def authenticate
  		puts params[:token]
  		session = Session.where(session_key: params[:token])[0]
  		if session.nil?
			 render :json => { error: INVALID_TOKEN }, :status => 422
		  elsif session.expiration_date < Date.current
			 render :json => { error: EXPIRED_TOKEN }, :status => 442
		  end
  	end
end
