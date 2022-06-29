class CreateBios < ActiveRecord::Migration[6.1]
  def change
    create_table :bios do |t|
      t.string :username
      t.text :description
      t.float :rendimiento, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
