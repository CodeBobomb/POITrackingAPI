class User < ActiveRecord::Base
	before_create :set_session
	belongs_to :company
	has_one :session

	def set_session
		@session = Session.new
	end
end
