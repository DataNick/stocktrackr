== README

Stocktrackr is a Rails 5 application using the yahoo-finance gem to search stock data and create positions and movements for users.
Each user can build a portfolio and populate late it with whatever company they want to track. When a position is created, additional shares bought or sold on the position will create movements that track transactions made.

Next steps:

I want to set up a scheduling tasks for positions to automatically ping the yahoo finance API to retrieve the most recent stock price and update the price column in a position.

Provide a more pleasing and minimal user interface where a user goes to the portfolio show page and sees a pie chart showing their positions by quantity, the current value of their portfolio, and a history of their portfolio activity.

