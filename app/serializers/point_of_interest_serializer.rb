class PointOfInterestSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date_added, :lat, :lng, :company_id
  has_one :state

  def state
  	output = {}
  	output[:motor_running] = object.state.motor_running
  	output[:windows_up] = object.state.windows_up
  	output[:car_locked] = object.state.car_locked
  	output
  end
  def company_id
  	object.company.id
  end
end
