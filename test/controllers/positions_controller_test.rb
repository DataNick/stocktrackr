require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post '/portfolios/:id/positions'
    assert_response :redirect
  end

  # test "should get new" do
  #   get positions_new_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get positions_destroy_url
  #   assert_response :success
  # end

end
