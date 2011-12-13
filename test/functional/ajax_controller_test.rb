require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get time" do
    get :time
    assert_response :success
  end

end
