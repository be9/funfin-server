class Api::V1::SessionSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :authentication_token
end
