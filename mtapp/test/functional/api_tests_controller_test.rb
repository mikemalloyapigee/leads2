require 'test_helper'

class ApiTestsControllerTest < ActionController::TestCase
  setup do
    @api_test = api_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_test" do
    assert_difference('ApiTest.count') do
      post :create, api_test: { auth_body: @api_test.auth_body, auth_headers: @api_test.auth_headers, auth_url: @api_test.auth_url }
    end

    assert_redirected_to api_test_path(assigns(:api_test))
  end

  test "should show api_test" do
    get :show, id: @api_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_test
    assert_response :success
  end

  test "should update api_test" do
    put :update, id: @api_test, api_test: { auth_body: @api_test.auth_body, auth_headers: @api_test.auth_headers, auth_url: @api_test.auth_url }
    assert_redirected_to api_test_path(assigns(:api_test))
  end

  test "should destroy api_test" do
    assert_difference('ApiTest.count', -1) do
      delete :destroy, id: @api_test
    end

    assert_redirected_to api_tests_path
  end
end
