require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_index_url
    assert_response :success
  end

  test "should get new" do
    get project_new_url
    assert_response :success
  end

end
