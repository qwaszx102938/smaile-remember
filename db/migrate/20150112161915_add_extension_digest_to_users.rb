class AddExtensionDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :extension_digest, :string
  end
end
