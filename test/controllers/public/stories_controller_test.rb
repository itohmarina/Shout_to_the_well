require "test_helper"

class Public::StoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_stories_show_url
    assert_response :success
  end

  test "should get new" do
    get public_stories_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_stories_edit_url
    assert_response :success
  end
end
