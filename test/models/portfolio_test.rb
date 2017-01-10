require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase

  setup do
    @user = users(:nicholas)
    sign_in @user
    @portfolio = portfolios(:one)
    @position = positions(:one)
  end

  test "should not save without a name being given" do
    portfolio = Portfolio.new
    assert_not portfolio.save, " Name must be given."
  end

  test "portfolio value" do
    assert_equal 6.02, @portfolio.portfolio_value.to_f
  end

  test "create valuation" do
    assert_equal 1, @portfolio.valuations.count
  end

  test "valuation amount" do
    @portfolio.portfolio_value #grab values of positions and number of shares for each position
    assert_equal 6.02, @portfolio.create_valuation.to_f
  end

  test "calculate amount" do
    VCR.use_cassette("twitter") do
      assert_equal 34.90, @portfolio.calculate_amount
    end
  end

  test "new price data" do
    VCR.use_cassette("twitter") do
      @portfolio.new_price_data
      assert_equal [34.90], @portfolio.new_price_data
    end
  end

  test "update portfolio amount" do
    VCR.use_cassette("twitter") do
      @portfolio.update_portfolio_amount
      assert_equal 34.90, @portfolio.amount.to_f
    end
  end

  test "create valuations" do
    VCR.use_cassette("twitter") do
      @portfolio.update_portfolio_amount
    end
    @portfolio.create_valuation
    assert_equal 3, Valuation.count #2 valuations are created by default in fixtures
    assert_equal 34.90, @portfolio.valuations.last.amount.to_f
  end

end
