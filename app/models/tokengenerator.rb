class TokenGenerator
	def self.create
		loop do
			key = SecureRandom.hex
			break key unless Session.find_by(session_key: key)
		end
	end
end