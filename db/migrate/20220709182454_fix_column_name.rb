class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :exchanges, :read_key, :public_key
    rename_column :exchanges, :write_key, :private_key
  end
end
