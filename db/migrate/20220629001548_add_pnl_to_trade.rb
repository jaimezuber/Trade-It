class AddPnlToTrade < ActiveRecord::Migration[6.1]
  def change
    add_column :trades, :pnl, :float
  end
end
