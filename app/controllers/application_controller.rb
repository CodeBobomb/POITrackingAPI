class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    head(:ok) if request.request_method == "OPTIONS"
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
  end
  
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
