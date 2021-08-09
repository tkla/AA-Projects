class AddIndexVideos < ActiveRecord::Migration[5.2]
  def change
    add_index :videos, :uploader_id
  end
end
