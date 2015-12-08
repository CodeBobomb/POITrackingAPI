class TrackingDevice < ActiveRecord::Base
	belongs_to :point_of_interest, class_name: "PointOfInterest"
end
