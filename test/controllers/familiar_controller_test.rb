require "test_helper"

class FamiliarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get familiar_index_url
    assert_response :success
  end
end
