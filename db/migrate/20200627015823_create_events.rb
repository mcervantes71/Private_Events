class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :details
      t.string :location
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :events, :name, unique: true
  end
end
