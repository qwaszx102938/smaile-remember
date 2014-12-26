class CreateAlertItems < ActiveRecord::Migration
  def change
    create_table :alert_items do |t|
      t.references :remember_item
      t.time :alert_time
      t.integer :level
      t.timestamps
    end
  end
end
