require 'test_helper'

class RouteControllerTest < ActionController::TestCase
  test "should get process" do
    get :process
    assert_response :success
  end

end
