class Position < ApplicationRecord
  belongs_to :portfolio
  has_many :movements, dependent: :destroy

  validates_uniqueness_of :ticker, scope: :portfolio_id
  validates :ticker,
            presence: { message: "must be given" }
  validates :quantity,
            numericality: true,
            presence: { message: 'must be given.' }
  validates :name,
            presence: { message: "could not be found." }

  before_validation :set_name
  before_validation :set_price
  before_create :upcase_ticker

  def buy(quantity)
    if get_quote['name'] && get_quote['name'] != 'N/A'
      movements.build(date: DateTime.strptime(get_quote.last_trade_date, '%m/%d/%Y'),
                      quantity: quantity,
                      price: get_quote.last_trade_price,
                      trade: 'buy')
    end
    save
  end

  def sell(quantity)
    @movement = movements.build(date: DateTime.strptime(get_quote.last_trade_date, '%m/%d/%Y'),
                    quantity: quantity,
                    price: get_quote.last_trade_price,
                    trade: 'sell')
    @movement.update_price_and_date
    self.update_attribute(:quantity, (self.quantity - quantity))
    binding.pry
    save

  end

  def position_value
    (price * quantity).round(2)
  end

  def update_price
    update_attribute(:price, get_quote.last_trade_price)
  end

  private

    def get_quote
      YAHOO_CLIENT.quotes([ticker], [:last_trade_price, :last_trade_date, :name, :symbol]).first
    end

    def set_name
      self.name = get_quote.name if get_quote['name'] != "N/A"
    end

    def set_price
      self.price = get_quote.last_trade_price if get_quote['name'] != 'N/A'
    end

    def upcase_ticker
      ticker.upcase!
    end

end
