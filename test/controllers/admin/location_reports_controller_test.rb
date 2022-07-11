require "test_helper"

class Admin::LocationReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_location_reports_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_location_reports_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_location_reports_edit_url
    assert_response :success
  end
end
