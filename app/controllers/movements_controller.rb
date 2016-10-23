class MovementsController < ApplicationController
  before_action :load_portfolio
  before_action :load_position
  before_action :load_positions

  def create
    @movement = @position.movements.build(movement_params)

    @movement.update_price_and_date
    @movement.trade ='buy'

    respond_to do |format|
      if @movement.save
        @position.update_attribute(:quantity, (@movement.quantity + @position.quantity))
        format.html { redirect_to @portfolio, notice: "#{params[:movement][:quantity]} share(s) successfully bought." }
        format.js
      else
        format.html { render template: 'portfolios/show' }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def index
    @movements = @position.movements.all
    respond_to do |format|
      format.html
      format.json { render json: @movements}
    end
  end

  def sell
    @movement = @position.movements.build(movement_params)
    @movement.trade ='sell'

    respond_to do |format|
      if @position.sell(params[:movement][:quantity].to_i)
        @position.update_attribute(:quantity, (@position.quantity - @movement.quantity))
        format.html { redirect_to @portfolio, notice: "You sold #{params[:movement][:quantity]} share(s)." }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render 'portfolios/show' }
        format.json { render json: @position.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def new
    @movement = Movement.new
  end

  private

    def movement_params
      params.require(:movement).permit(:position_id, :quantity, :price, :date, :trade)
    end

    def load_portfolio
      @portfolio = Portfolio.find(params[:portfolio_id])
      @positions =  @portfolio.positions
      @position = @portfolio.positions.find(params[:position_id])
    end

    def load_position
      @portfolio = Portfolio.find(params[:portfolio_id])
      @positions =  @portfolio.positions
    end

    def load_positions
      @portfolio = Portfolio.find(params[:portfolio_id])
      @positions =  @portfolio.positions
    end
end
