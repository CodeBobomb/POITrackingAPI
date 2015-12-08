require 'test_helper'

class TrackingDevicesControllerTest < ActionController::TestCase
  setup do
    @tracking_device = tracking_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tracking_devices)
  end

  test "should create tracking_device" do
    assert_difference('TrackingDevice.count') do
      post :create, tracking_device: { device_name: @tracking_device.device_name, device_type: @tracking_device.device_type }
    end

    assert_response 201
  end

  test "should show tracking_device" do
    get :show, id: @tracking_device
    assert_response :success
  end

  test "should update tracking_device" do
    put :update, id: @tracking_device, tracking_device: { device_name: @tracking_device.device_name, device_type: @tracking_device.device_type }
    assert_response 204
  end

  test "should destroy tracking_device" do
    assert_difference('TrackingDevice.count', -1) do
      delete :destroy, id: @tracking_device
    end

    assert_response 204
  end
end
