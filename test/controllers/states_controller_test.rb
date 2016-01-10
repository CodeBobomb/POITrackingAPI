require 'test_helper'

class StatesControllerTest < ActionController::TestCase
  setup do
    @state = states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:states)
  end

  test "should create state" do
    assert_difference('State.count') do
      post :create, state: { car_locked: @state.car_locked, motor_running: @state.motor_running, point_of_interest_id: @state.point_of_interest_id, windows_up: @state.windows_up }
    end

    assert_response 201
  end

  test "should show state" do
    get :show, id: @state
    assert_response :success
  end

  test "should update state" do
    put :update, id: @state, state: { car_locked: @state.car_locked, motor_running: @state.motor_running, point_of_interest_id: @state.point_of_interest_id, windows_up: @state.windows_up }
    assert_response 204
  end

  test "should destroy state" do
    assert_difference('State.count', -1) do
      delete :destroy, id: @state
    end

    assert_response 204
  end
end
