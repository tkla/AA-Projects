class ChangePoems < ActiveRecord::Migration[5.2]
  def change
    rename_column :poems, :author, :author_id
  end
end
