class PointOfInterest < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :tracking_devices, :class_name => "TrackingDevice", foreign_key: "poi_id"
end
