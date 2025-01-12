class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :capacity
      t.date :date
      t.time :time
      t.string :host

      t.timestamps
    end
  end
end
