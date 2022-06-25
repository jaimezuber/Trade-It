class CreateExchanges < ActiveRecord::Migration[6.1]
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :public_key
      t.string :private_key
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
