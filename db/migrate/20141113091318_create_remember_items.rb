class CreateRememberItems < ActiveRecord::Migration
  def change
    create_table :remember_items do |t|
      t.text :name
      t.text :content

      t.timestamps
    end
  end
end
