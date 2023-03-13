require "test_helper"

class TripActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get trip_activities_update_url
    assert_response :success
  end
end
