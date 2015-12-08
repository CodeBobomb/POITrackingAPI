class PointOfInterestSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date_added
end
