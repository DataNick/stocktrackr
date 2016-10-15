class Movement < ApplicationRecord
  belongs_to :position

  def update_price
    # binding.pry
    ticker = self.position['ticker']
    price = CLIENT.quotes([ticker], [:last_trade_price]).first
    self.update_attribute( :price, price.last_trade_price )
  end
end
