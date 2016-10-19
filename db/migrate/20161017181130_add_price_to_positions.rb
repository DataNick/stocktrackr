class AddPriceToPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :price, :decimal
  end
end
