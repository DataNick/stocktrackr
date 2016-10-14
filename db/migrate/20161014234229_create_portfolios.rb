class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
