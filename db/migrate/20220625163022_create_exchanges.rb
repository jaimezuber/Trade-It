class CreateExchanges < ActiveRecord::Migration[6.1]
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :read_key
      t.string :write_key
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
