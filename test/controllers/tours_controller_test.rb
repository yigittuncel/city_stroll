require "test_helper"

class ToursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tours_index_url
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
