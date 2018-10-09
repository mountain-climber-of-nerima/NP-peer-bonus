require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get login_form" do
    get :login_form
    assert_response :success
  end

end
