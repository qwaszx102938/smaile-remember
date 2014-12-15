class CreateRemembers < ActiveRecord::Migration
  def change
    create_table :remembers do |t|
      t.string :remember_content
      t.text   :remember_reference
      t.timestamps
    end
    add_index :remembers, :remember_content, unique: true
  end
end
