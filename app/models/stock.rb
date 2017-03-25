class Stock

  attr_accessor :ticker

  def initialize(ticker)
    @ticker = ticker
  end

  def search_api(ticker)
    get_historical_quote
  end

  private

    def get_historical_quote
      begin
        YAHOO_CLIENT.historical_quotes(@ticker, { start_date: Time::now-(60*60*24*365), end_date: Time::now })
      rescue OpenURI::HTTPError => error
        response = error.io
        response.status
        response.string
      end
    end
end