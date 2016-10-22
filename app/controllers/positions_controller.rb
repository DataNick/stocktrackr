class PositionsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_portfolio

  def new
    @position = Position.new
  end

  def create
    @position = @portfolio.positions.build(position_params)
    respond_to do |format|
      if @position.buy(params[:position][:quantity].to_i)
        format.html { redirect_to @portfolio, notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render 'portfolios/show', alert: 'Position could not be made.' }
        format.json { render json: @position.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def index
    @positions = Position.all
  end

  def show
    @position = @portfolio.positions.find(params[:id])
    @movement = Movement.new
  end

  def destroy
  end

  private

    def load_portfolio
      @portfolio = Portfolio.find(params[:portfolio_id])
    end

    def position_params
      params.require(:position).permit(:ticker, :name, :quantity, :portfolio_id)
    end
end
