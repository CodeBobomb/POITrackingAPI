class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
protected
	def authenticate
		authenticate_token || render_unauthorized
	end

	def authenticate_login
		authenticate_basic_auth || render_unauthorized
	end

  def authenticate_token
  	authenticate_with_http_token do |token|
  		@session = Session.find_by(session_key: token)
      return false if @session.nil?
      if @session.expiration_date < Date.current
        @message = "Expired token."
        return false
      end

      @session
  	end
  end

  def authenticate_basic_auth
  	authenticate_with_http_basic do |username, password| 
  		User.find_by(username: username, password: password)
    end
  end

  def render_unauthorized
  	self.headers['WWW-Authenticate'] = 'Token realm="None"'
    json_response = { error: 'No authorization' }
    json_response[:message] = @message if @message
  	render json: json_response, status: 401 
  end
end
