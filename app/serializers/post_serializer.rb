class PostSerializer < ActiveModel::Serializer
  attributes :id, :message
  has_one :user
end
