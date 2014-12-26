class AddStateToAlerts < ActiveRecord::Migration
  def change
    change_table :alert_items do |t|
      t.integer :state
    end

    change_table  :alert_item_hists  do |t|
      t.integer :state
    end
  end
end
