class Company < ActiveRecord::Base
	has_many :employees, class_name: "User"
	has_many :poi_items, class_name: "PointOfInterest"
end
