class TrackingDevice < ActiveRecord::Base
  belongs_to :poi, :class_name => "PointOfInterest"
end
