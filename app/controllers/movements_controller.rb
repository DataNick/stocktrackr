class MovementsController < ApplicationController
  before_action :load_portfolio_and_position

  def create
    @movement = Movement.new(movement_params)
    @movement.position_id = @position.id
    @movement.update_price
    @movement.date = DateTime.now
    @movement.trade ='buy'
    @position.quantity = (@movement.quantity + @position.quantity)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to @portfolio, notice: 'Movement was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def index
  end

  def new
    @movement = Movement.new
  end

  private

    def movement_params
      params.require(:movement).permit(:position_id, :quantity, :price, :date, :trade)
    end

    def load_portfolio_and_position
      @portfolio = Portfolio.find(params[:portfolio_id])
      @position = @portfolio.positions.find(params[:position_id])
    end
end
