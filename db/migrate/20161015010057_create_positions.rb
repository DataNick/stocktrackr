class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :ticker
      t.string :name
      t.integer :quantity
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
