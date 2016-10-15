class PositionsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_portfolio
  def create
  end

  def new
    @position = Position.new
  end

  def index
    @positions = Position.all
  end

  def destroy
  end

  private

    def load_portfolio
      @portfolio = Portfolio.find(params[:portfolio_id])
    end
end
