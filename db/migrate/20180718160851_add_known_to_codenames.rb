class AddKnownToCodenames < ActiveRecord::Migration[5.2]
  def change
    add_column :codenames, :known, :integer
  end
end
