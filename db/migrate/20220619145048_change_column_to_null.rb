class ChangeColumnToNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :reservations, :number, true
  end
end
