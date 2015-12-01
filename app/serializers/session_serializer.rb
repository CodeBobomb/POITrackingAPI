class SessionSerializer < ActiveModel::Serializer
  attributes :id, :session_key, :expiration_date
end
