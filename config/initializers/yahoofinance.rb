require 'yahoo-finance'

YAHOO_CLIENT = YahooFinance::Client.new

 # yahoo.quotes(["AAPL"]).first.last_trade_price

# price = CLIENT.quotes(["AAPL"], [:last_trade_price]).first
# puts price.last_trade_price.class