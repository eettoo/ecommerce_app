require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get woman" do
    get pages_woman_url
    assert_response :success
  end

  test "should get man" do
    get pages_man_url
    assert_response :success
  end

end
