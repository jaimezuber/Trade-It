class AddStatusToSuscrption < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :status, :boolean, default: true
  end
end
