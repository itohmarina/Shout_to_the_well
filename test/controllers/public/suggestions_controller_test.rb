require "test_helper"

class Public::SuggestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_suggestions_new_url
    assert_response :success
  end
end
