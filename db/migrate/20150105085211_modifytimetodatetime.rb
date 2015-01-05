class Modifytimetodatetime < ActiveRecord::Migration
  def change
  change_table(:alert_items) do |t|
   t.remove :alert_time
   t.datetime :alert_time
   end
   
   change_table(:alert_item_hists) do |t|
   t.remove :alert_time
   t.datetime :alert_time
   end
  end
end
