# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
PointOfInterest.delete_all
TrackingDevice.delete_all

User.create(first_name: "Adnan", last_name: "Muslija", username: "adnanabh", email: "email@mail.com", password: "password123", date_of_birth: Date.new)
PointOfInterest.create(name: "A Point", description: "Some Point", owner: User.first)
TrackingDevice.create(device_name: "Tracking Device", device_type: "gps", poi: PointOfInterest.first)
