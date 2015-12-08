require 'tokengenerator.rb'

class Session < ActiveRecord::Base
	belongs_to :user
	before_create :set_session_key
	before_create :set_date

	def set_session_key
		self.session_key = TokenGenerator.create
	end

	def set_date
		self.expiration_date = Date.current + 7
	end
end
