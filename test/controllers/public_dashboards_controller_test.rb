require "test_helper"

class PublicDashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_dashboards_index_url
    assert_response :success
  end
end
