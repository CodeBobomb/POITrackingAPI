class User < ActiveRecord::Base
	belongs_to :company
	has_one :session
end
