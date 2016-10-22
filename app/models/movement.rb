class Movement < ApplicationRecord
  belongs_to :position
  validates :quantity, presence: true

  def update_price_and_date
    ticker = self.position['ticker']
    price = YAHOO_CLIENT.quotes([ticker], [:last_trade_price]).first
    date =  YAHOO_CLIENT.quotes([ticker], [:last_trade_date]).first
    update_attribute( :price, price.last_trade_price )
    update_attribute( :date, DateTime.strptime(date.last_trade_date, '%m/%d/%Y'))
  end

end
