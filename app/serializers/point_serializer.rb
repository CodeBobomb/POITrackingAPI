class PointSerializer < ActiveModel::Serializer
  attributes :id, :lng, :lat
  has_one :point_of_interest
end
