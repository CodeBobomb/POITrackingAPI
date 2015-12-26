# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Company.delete_all
Session.delete_all
Point.delete_all
PointOfInterest.delete_all
TrackingDevice.delete_all

company = Company.create!(name: "Atlantbh", headquarters: "Sarajevo")
user = User.create!(first_name: "Adnan", last_name: "Muslija", username: "adnanabh", email: "email@mail.com", password: "password123", date_of_birth: Date.current, company: company)
user.session = Session.new
PointOfInterest.create(name: "A Point", description: "Some Point", company: Company.first, lat: 44.201389, lng: 17.906389)
TrackingDevice.create(device_name: "Tracking Device", device_type: "gps", point_of_interest: PointOfInterest.first)
