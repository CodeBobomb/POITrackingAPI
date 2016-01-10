class PointOfInterest < ActiveRecord::Base
  belongs_to :company
  has_many :tracking_devices
  has_one :point
  has_one :state
  after_create :create_state
  before_destroy :destroy_tracking_devices, :destroy_point, :destroy_state

	def create_state
    self.state = State.create
	end

	def destroy_tracking_devices
    self.tracking_devices.each { |device| device.destroy }
  end

  def destroy_point
  	self.point.destroy if self.point
  end

  def destroy_state
  	self.state.destroy
  end
end
