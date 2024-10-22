require "test_helper"

class LandmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get landmarks_index_url
    assert_response :success
  end

  test "should get show" do
    get landmarks_show_url
    assert_response :success
  end
end
