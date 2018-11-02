class UploadsControllerSerializer < ActiveModel::Serializer
  attributes :id, :index, :show, :edit, :update, :destroy
end
