require 'test_helper'

class PresentationControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get presentation_welcome_url
    assert_response :success
  end

end
