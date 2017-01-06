require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  setup do
    @user = users(:nicholas)
    sign_in @user
    @portfolio = portfolios(:one)
    # @position = positions(:one)
  end


end
