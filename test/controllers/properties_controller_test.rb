require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post :create, property: { address1: @property.address1, address2: @property.address2, altitude: @property.altitude, city: @property.city, country: @property.country, latitude: @property.latitude, length_in_feet: @property.length_in_feet, longitude: @property.longitude, size_in_acres: @property.size_in_acres, state: @property.state, user_id: @property.user_id, width_in_feet: @property.width_in_feet, zipcode: @property.zipcode }
    end

    assert_redirected_to property_path(assigns(:property))
  end

  test "should show property" do
    get :show, id: @property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property
    assert_response :success
  end

  test "should update property" do
    patch :update, id: @property, property: { address1: @property.address1, address2: @property.address2, altitude: @property.altitude, city: @property.city, country: @property.country, latitude: @property.latitude, length_in_feet: @property.length_in_feet, longitude: @property.longitude, size_in_acres: @property.size_in_acres, state: @property.state, user_id: @property.user_id, width_in_feet: @property.width_in_feet, zipcode: @property.zipcode }
    assert_redirected_to property_path(assigns(:property))
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete :destroy, id: @property
    end

    assert_redirected_to properties_path
  end
end
