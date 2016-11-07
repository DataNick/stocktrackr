class ValuationsController < ApplicationController
  before_action :load_portfolio

  def create
    @portfolio.portfolio_value
    @valuation = @portfolio.valuations.build(:amount, @portfolio.amount)
  end

  private

    def valuation_params
      params.require(:valuation).permit(:amount)
    end

end
