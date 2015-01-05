class FixStringColumn < ActiveRecord::Migration
  def change
   change_table :users do |t|
    t.remove :username, :email,:password
    t.string :username,:email, :password
   end

  end
end
