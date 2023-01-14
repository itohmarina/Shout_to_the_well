require "test_helper"

class GroupUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_users_index_url
    assert_response :success
  end
end
