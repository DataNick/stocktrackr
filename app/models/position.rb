class Position < ApplicationRecord
  belongs_to :portfolio
  has_many :movements, dependent: :destroy

  validates_uniqueness_of :ticker, scope: :portfolio_id
  validates_presence_of :ticker, :message => 'Invalid ticker.'
  validates_presence_of :quantity, :message => 'Must input a number.'
  validates_presence_of :name, :message => "Search for name revealed no match."

  before_validation :search_name
  before_create :upcase_ticker

  def buy(quantity)
    if get_quote.valid?
      movements.build(date: DateTime.strptime(get_quote.last_trade_date, '%m/%d/%Y'), quantity: quantity, price: get_quote.last_trade_price, trade: 'buy')
    end
    save
  end

  def sell(quantity)
    movements.build(date: DateTime.strptime(get_quote.last_trade_date, '%m/%d/%Y'), quantity: quantity, price: get_quote.last_trade_price, trade: 'sell')
    save
  end

  private

  def get_quote
    YAHOO_CLIENT.quotes([ticker], [:last_trade_price, :last_trade_date, :name, :symbol]).first
  end

  def search_name
    self.name = get_quote['name'] if get_quote['name'] != "N/A"
  end

  def upcase_ticker
    ticker.upcase!
  end

end
