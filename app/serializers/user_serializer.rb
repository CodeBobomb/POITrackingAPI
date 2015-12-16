class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :date_of_birth, :email, :first_name, :last_name, :company_id, :session_key
 	
  def session_key
  	object.session.session_key
  end
end
