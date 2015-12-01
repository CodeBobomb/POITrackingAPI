class User < ActiveRecord::Base
	has_many :poi_items, class_name: "PointOfInterest", foreign_key: "owner_id"
	has_one :session
end
