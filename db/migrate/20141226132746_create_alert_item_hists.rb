class CreateAlertItemHists < ActiveRecord::Migration
  def change
    create_table :alert_item_hists do |t|
      t.references :remember_item
      t.time :alert_time
      t.integer :level
      t.timestamps

    end
  end
end
