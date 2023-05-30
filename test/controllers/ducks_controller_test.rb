require "test_helper"

class DucksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ducks_index_url
    assert_response :success
  end
end
