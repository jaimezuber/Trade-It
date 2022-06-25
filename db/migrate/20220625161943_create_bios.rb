class CreateBios < ActiveRecord::Migration[6.1]
  def change
    create_table :bios do |t|
      t.string :username
      t.text :description
      t.float :rendimiento

      t.timestamps
    end
  end
end
