require 'test_helper'

class UserOptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_options_new_url
    assert_response :success
  end

  test "should get create" do
    get user_options_create_url
    assert_response :success
  end

  test "should get delete" do
    get user_options_delete_url
    assert_response :success
  end

  test "should get update" do
    get user_options_update_url
    assert_response :success
  end

  test "should get index" do
    get user_options_index_url
    assert_response :success
  end

end
