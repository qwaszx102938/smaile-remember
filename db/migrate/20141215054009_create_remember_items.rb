class CreateRememberItems < ActiveRecord::Migration
  def change
    create_table :remember_items do |t|
      t.references :user, index: true
      t.references :remember, index: true

      t.timestamps
    end
  end
end
