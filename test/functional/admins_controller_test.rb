require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get show_users" do
    get :show_users
    assert_response :success
  end

  test "should get show_products" do
    get :show_products
    assert_response :success
  end

end
