class AddsumPriceToreservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :sum_price, :integer
  end
end
