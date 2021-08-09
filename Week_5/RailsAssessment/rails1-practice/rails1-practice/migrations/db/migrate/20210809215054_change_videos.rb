class ChangeVideos < ActiveRecord::Migration[5.2]
  def change
      rename_column :videos, :name, :title

      add_index :videos, :title
  end
end
