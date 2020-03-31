require 'test_helper'

class GreetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_chapter" do
    get greetings_get_chapter_url
    assert_response :success
  end

end
