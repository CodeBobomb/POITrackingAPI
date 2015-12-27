namespace :tracking do
  desc "Start mocking poi movement"
  task start_tracking_job: :environment do
  	loop do
  		tracked_pois = PointOfInterest.where(tracking: true)
  		tracked_pois.each do |poi|
        if poi.point.inc 
    			if poi.lng < poi.point.lng
    				poi.lng += poi.point.lng_inc
            puts "first"
    			elsif poi.lng >= poi.point.lng 
    				poi.point.lng -= poi.point.inc_value
    				poi.point.inc = false
            puts "second"
    			end
        else
    			if poi.lng > poi.point.lng
    				poi.lng -= poi.point.lng_inc
            puts "third"
    			elsif poi.lng <= poi.point.lng
    				poi.point.lng += poi.point.inc_value
    				poi.point.inc = true
            puts "fourth"
    			end
        end
  			poi.point.save
  			poi.save
  		end
      puts "sleeping"
      sleep 1 
  	end
  end

end
