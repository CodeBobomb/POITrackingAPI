class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :date_of_birth, :email, :first_name, :last_name
end
