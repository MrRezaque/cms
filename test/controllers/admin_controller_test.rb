require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get root" do
    get :root
    assert_response :success
  end

  test "should get info" do
    get :info
    assert_response :success
  end

end
