# ## `comments`

# | column name        | data type | details                        |
# |:-------------------|:---------:|:-------------------------------|
# | `id`               | integer   | not null, primary key          |
# | `body`             | string    | not null                       | 
# | `video_id`         | integer   | not null, indexed, foreign key | 
# | `commenter_id`     | integer   | not null, indexed, foreign key |
# | `parent_comment_id`| integer   | indexed, foreign key           |
# | `created_at`       | datetime  | not null                       |
# | `updated_at`       | datetime  | not null                       |
# 

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body, null: false 
      
      t.integer :video_id, null: false     #Indexed
      t.integer :commenter_id, null: false #Indexed
      t.integer :parent_comment_id         #Indexed

      t.datetime :created_at, null: false 
      t.datetime :updated_at, null: false 
    end

    add_index :comments, :commenter_id 
    add_index :comments, :video_id
    add_index :comments, :parent_comment_id
  end
end
