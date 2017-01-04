namespace :valuation do

  desc "Retrieve real-time price data"
  task update_price: :environment do
    Portfolio.all.each do |portfolio|
      portfolio.update_portfolio_amount
    end
  end

  desc "Create new valuation object with value set to portfolio amount value"
  task snapshot: :environment do
    Portfolio.all.each do |portfolio|
      portfolio.create_valuation
    end
  end

end

