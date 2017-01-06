class PagesController < ApplicationController

  def search
    stock = Stock.new(params[:q])
    @stock = stock.search_api(params[:q])
    render :show
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @stock}
      format.js
    end
  end

  def about
  end

end
