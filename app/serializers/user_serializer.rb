class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email
end
