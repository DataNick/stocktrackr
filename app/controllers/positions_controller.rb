class PositionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_portfolio
  def create
  end

  def new
  end

  def index
  end

  def destroy
  end

  private

    def set_portfolio
      @portfolio = Portfolio.find(params[:portfolio][:id])
    end
end
