class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.text :understanding, null: false
      t.text :improvement, null: false

      t.timestamps
    end
  end
end
