class CreateMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.references :position, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.datetime :date
      t.string :trade

      t.timestamps
    end
  end
end
