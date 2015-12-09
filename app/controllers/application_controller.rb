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
  		Session.find_by(session_key: token)
  	end
  end

  def authenticate_basic_auth
  	authenticate_with_http_basic do |username, password| 
  		User.find_by(username: username, password: password)
    end
  end

  def render_unauthorized
  	self.headers['WWW-Authenticate'] = 'Token realm="None"'

  	render json: { error: 'No authorization' }, status: 401 
  end
end
