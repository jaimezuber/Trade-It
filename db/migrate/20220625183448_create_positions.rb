class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.references :trade, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.float :open_price
      t.float :close_price
      t.string :external_id
      t.float :pnl

      t.timestamps
    end
  end
end
