class AddVolatilidadToBio < ActiveRecord::Migration[6.1]
  def change
    add_column :bios, :volatilidad, :float
  end
end
