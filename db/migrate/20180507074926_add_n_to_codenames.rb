class AddNToCodenames < ActiveRecord::Migration[5.2]
  def change
    add_column :codenames, :n, :integer
  end
end
