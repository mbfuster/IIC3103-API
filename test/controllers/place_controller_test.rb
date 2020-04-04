require 'test_helper'

class PlaceControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get place_show_url
    assert_response :success
  end

end
