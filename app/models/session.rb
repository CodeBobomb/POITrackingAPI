class Session < ActiveRecord::Base
	belongs_to :user
	before_create :generate_authentication_token
	before_create :set_date

	def generate_authentication_token
		loop do
	        self.session_key = SecureRandom.hex(64)
	    	break unless Session.find_by(session_key: self.session_key)
	    end
	end

	def set_date
		self.expiration_date = Date.current + 7
	end
end
