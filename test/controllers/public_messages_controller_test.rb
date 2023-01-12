require "test_helper"

class PublicMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_messages_index_url
    assert_response :success
  end
end
