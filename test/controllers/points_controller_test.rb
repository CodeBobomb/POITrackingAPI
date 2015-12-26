require 'test_helper'

class PointsControllerTest < ActionController::TestCase
  setup do
    @point = points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
  end

  test "should create point" do
    assert_difference('Point.count') do
      post :create, point: { lat: @point.lat, lng: @point.lng, point_of_interest_id: @point.point_of_interest_id }
    end

    assert_response 201
  end

  test "should show point" do
    get :show, id: @point
    assert_response :success
  end

  test "should update point" do
    put :update, id: @point, point: { lat: @point.lat, lng: @point.lng, point_of_interest_id: @point.point_of_interest_id }
    assert_response 204
  end

  test "should destroy point" do
    assert_difference('Point.count', -1) do
      delete :destroy, id: @point
    end

    assert_response 204
  end
end
