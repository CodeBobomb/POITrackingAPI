class StateSerializer < ActiveModel::Serializer
  attributes :id, :motor_running, :windows_up, :car_locked
  has_one :point_of_interest
end
