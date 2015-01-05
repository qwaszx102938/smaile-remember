class AddReferenceUserToAlerts < ActiveRecord::Migration
  def change
    change_table :alert_items do |t|
     t.references :user ,index: true
    end

    change_table  :alert_item_hists  do |t|
      t.references :user ,index: true
    end
  end
end
