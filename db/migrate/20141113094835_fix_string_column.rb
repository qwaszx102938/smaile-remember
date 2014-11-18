class FixStringColumn < ActiveRecord::Migration
  def change
   change_table :users do |t|
    t.remove :username, :email,:password
    t.string :username,:email, :password
   end
   
   change_table :remember_items do |t|
   t.remove :name
   t.string :name
   end
  end
end
