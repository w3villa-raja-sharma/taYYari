require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact_us" do
    get pages_contact_us_url
    assert_response :success
  end
end
