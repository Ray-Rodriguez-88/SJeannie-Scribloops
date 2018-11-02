class UploadedSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :portfolio_id, :isPublic
end
