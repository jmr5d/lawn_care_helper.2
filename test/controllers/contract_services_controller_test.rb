require 'test_helper'

class ContractServicesControllerTest < ActionController::TestCase
  setup do
    @contract_service = contract_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_service" do
    assert_difference('ContractService.count') do
      post :create, contract_service: { contract_id: @contract_service.contract_id, service_type_id: @contract_service.service_type_id }
    end

    assert_redirected_to contract_service_path(assigns(:contract_service))
  end

  test "should show contract_service" do
    get :show, id: @contract_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_service
    assert_response :success
  end

  test "should update contract_service" do
    patch :update, id: @contract_service, contract_service: { contract_id: @contract_service.contract_id, service_type_id: @contract_service.service_type_id }
    assert_redirected_to contract_service_path(assigns(:contract_service))
  end

  test "should destroy contract_service" do
    assert_difference('ContractService.count', -1) do
      delete :destroy, id: @contract_service
    end

    assert_redirected_to contract_services_path
  end
end
