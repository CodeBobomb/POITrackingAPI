require 'test_helper'

class PointOfInterestsControllerTest < ActionController::TestCase
  setup do
    @point_of_interest = point_of_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_of_interests)
  end

  test "should create point_of_interest" do
    assert_difference('PointOfInterest.count') do
      post :create, point_of_interest: { date_added: @point_of_interest.date_added, description: @point_of_interest.description, name: @point_of_interest.name }
    end

    assert_response 201
  end

  test "should show point_of_interest" do
    get :show, id: @point_of_interest
    assert_response :success
  end

  test "should update point_of_interest" do
    put :update, id: @point_of_interest, point_of_interest: { date_added: @point_of_interest.date_added, description: @point_of_interest.description, name: @point_of_interest.name }
    assert_response 204
  end

  test "should destroy point_of_interest" do
    assert_difference('PointOfInterest.count', -1) do
      delete :destroy, id: @point_of_interest
    end

    assert_response 204
  end
end
