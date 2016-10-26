class CreateValuations < ActiveRecord::Migration[5.0]
  def change
    create_table :valuations do |t|
      t.references :portfolio, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
