class Position < ApplicationRecord
  belongs_to :portfolio
  has_many :movements, dependent: :destroy

  validates_uniqueness_of :ticker, scope: :portfolio_id
  validates_presence_of :name,
                        :message => "Stock not found on Yahoo Finance."
  before_validation :get_quote_name

  def buy(quantity)
    ticker.upcase!
    movements.build(date: DateTime.strptime(quote.last_trade_date, '%m/%d/%Y'), quantity: quantity, price: quote.last_trade_price, trade: 'buy')
    save
  end

  def sell(quantity)
    movements.build(date: DateTime.strptime(quote.last_trade_date, '%m/%d/%Y'), quantity: quantity, price: quote.last_trade_price, trade: 'sell')
    save
  end

  private

  def quote
    @quote ||= CLIENT.quotes([ticker], [:last_trade_price, :last_trade_date, :name, :symbol]).first
  end

  def get_quote_name
    self.name = @quote.name
  end

end
