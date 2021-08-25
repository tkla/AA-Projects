class ChangePoemStanza < ActiveRecord::Migration[5.2]
  def change
    rename_column :poems, :stanza, :stanzas 
  end
end
