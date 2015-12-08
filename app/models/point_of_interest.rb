class PointOfInterest < ActiveRecord::Base
	belongs_to :company
	has_many :tracking_devices
end
