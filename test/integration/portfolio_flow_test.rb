require 'test_helper'

class PortfolioFlowTest < ActionDispatch::IntegrationTest
  test "non-signed in user is redirected to login page" do
    get '/portfolios'
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', "Log in"
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "signed in user can visit portfolio index page" do
    @user = users(:nicholas)
    sign_in @user
    get "/portfolios"
    assert_select "h1", "Portfolios"
  end

  test "show portfolio page" do
    @user = users(:nicholas)
    sign_in @user
    get "/portfolios/#{portfolios(:one).id}"
    assert_select "h2", "Name:\n  MyString"
  end

  test "create a portfolio" do
    @user = users(:nicholas)
    sign_in @user
    post '/portfolios', params: { portfolio: {name: 'Sample' }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal 'Portfolio was successfully created.', flash[:notice]
    assert_equal 3, Portfolio.count
  end

  test "can not create a portfolio without a name" do
    @user = users(:nicholas)
    sign_in @user
    post '/portfolios', params: { portfolio: {name: '' }}
    assert_response :success
    assert_select "h1", "New Portfolio"
    assert_equal 2, Portfolio.count
  end

end
