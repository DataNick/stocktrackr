namespace :valuation do

  desc "Calculate current portfolio amount"
  task calculate: :environment do
    Portfolio.all.each do |portfolio|
      portfolio.portfolio_value
    end
  end

  desc "Create new valuation object with value set to portfolio amount value"
  task snapshot: :environment do
    Portfolio.all.each do |portfolio|
      portfolio.create_valuation
    end
  end

end
