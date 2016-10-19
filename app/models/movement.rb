class Movement < ApplicationRecord
  belongs_to :position
  validates :quantity, presence: true

  def update_price_and_date
    # binding.pry
    ticker = self.position['ticker']
    price = CLIENT.quotes([ticker], [:last_trade_price]).first
    date =  CLIENT.quotes([ticker], [:last_trade_date]).first
    self.update_attribute( :price, price.last_trade_price )
    self.update_attribute( :date, DateTime.strptime(date.last_trade_date, '%m/%d/%Y'))
  end
end
