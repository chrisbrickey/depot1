require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_url         #added myself to replace below line because admin_index_url not found in rest of project
    # get admin_index_url
    assert_response :success
  end

end
