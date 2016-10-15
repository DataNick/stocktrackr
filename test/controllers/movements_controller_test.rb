require 'test_helper'

class MovementsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movements_create_url
    assert_response :success
  end

  test "should get new" do
    get movements_new_url
    assert_response :success
  end

end
