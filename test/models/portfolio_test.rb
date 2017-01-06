require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase

  setup do
    @user = users(:nicholas)
    sign_in @user
    @portfolio = portfolios(:one)
    @position = positions(:one)
  end

  test "portfolio value" do
    assert_equal 6, @portfolio.portfolio_value
  end

  test "create valuation" do
    assert_equal 1, @portfolio.valuations.count
  end

  test "valuation amount" do
    @portfolio.portfolio_value #grab values of positions and number of shares for each position
    assert_equal 6, @portfolio.create_valuation
  end

  # test "retrieves latest price data" do
  #   VCR.use_cassette('twitter') do
  #     @portfolio.new_price_data
  #   end
  # end

end
