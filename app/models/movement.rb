class Movement < ApplicationRecord
  belongs_to :position
  validates :quantity,
            presence: true,
            numericality: true


  def update_price_and_date
    ticker = self.position['ticker']
    price = YAHOO_CLIENT.quotes([ticker], [:last_trade_price]).first
    date =  YAHOO_CLIENT.quotes([ticker], [:last_trade_date]).first
    update_attribute( :price, price.last_trade_price )
    update_attribute( :date, DateTime.strptime(date.last_trade_date, '%m/%d/%Y'))
  end

  private

    def new_price_data(ticker)
      price = YAHOO_CLIENT.quotes([ticker], [:last_trade_price]).first
      price.last_trade_price
    end

    def new_date_data(ticker)
      date =  YAHOO_CLIENT.quotes([ticker], [:last_trade_date]).first
      DateTime.strptime(date.last_trade_date, '%m/%d/%Y')
    end

end
