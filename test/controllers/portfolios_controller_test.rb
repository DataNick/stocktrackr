require 'test_helper'

class PortfoliosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:nicholas)
    sign_in @user
    @portfolio = @user.portfolios.create(:name => 'Stocks')
  end

  test "should get index" do
    get '/portfolios'
    assert_response :success
  end

  # test "should get new" do
  #   get new_portfolio_url
  #   assert_response :success
  # end

  # test "should create portfolio" do
  #   assert_difference('Portfolio.count') do
  #     post portfolios_url, params: { portfolio: { amount: @portfolio.amount, name: @portfolio.name } }
  #   end

  #   assert_redirected_to portfolio_url(Portfolio.last)
  # end

  # test "should show portfolio" do
  #   get portfolio_url(@portfolio)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_portfolio_url(@portfolio)
  #   assert_response :success
  # end

  # test "should update portfolio" do
  #   patch portfolio_url(@portfolio), params: { portfolio: { amount: @portfolio.amount, name: @portfolio.name } }
  #   assert_redirected_to portfolio_url(@portfolio)
  # end

  # test "should destroy portfolio" do
  #   assert_difference('Portfolio.count', -1) do
  #     delete portfolio_url(@portfolio)
  #   end

  #   assert_redirected_to portfolios_url
  # end
end
