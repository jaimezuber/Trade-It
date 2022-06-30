class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.integer :amount_per_trade
      t.integer :max_amount
      t.float :rendimiento, default: 0
      t.references :trader, null: false, foreign_key: { to_table: 'users' }
      t.references :subscriber, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
