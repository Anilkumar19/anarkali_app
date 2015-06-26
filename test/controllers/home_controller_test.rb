require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get anar" do
    get :anar
    assert_response :success
  end

end
