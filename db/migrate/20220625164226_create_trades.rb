class CreateTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :trades do |t|
      t.string :symbol
      t.float :entry_price
      t.float :exit_price
      t.float :take_proffit
      t.float :stop_loss
      t.string :side
      t.references :trader, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
