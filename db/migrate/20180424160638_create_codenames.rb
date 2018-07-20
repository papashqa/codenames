class CreateCodenames < ActiveRecord::Migration[5.2]
  def change
    create_table :codenames do |t|
      t.integer :team
      t.text :word
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
