class CreatePoems < ActiveRecord::Migration[5.2]
  def change
    create_table :poems do |t|
      t.string :title, null: false 
      t.string :stanza, null: false 
      t.boolean :complete, default: false, null: false 
      t.integer :author, null: false 
      t.timestamps
    end
    
  end
end
