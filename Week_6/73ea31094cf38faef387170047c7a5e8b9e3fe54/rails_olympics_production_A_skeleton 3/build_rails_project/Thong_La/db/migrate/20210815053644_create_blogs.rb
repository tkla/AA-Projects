class CreateBlogs < ActiveRecord::Migration[5.2]

  # `Blogs` will have a `title` which is a string, a `body` which is text, and
  #  will belong to a `User` (name this column `author_id`).
  #  - A User has many blogs, but those blogs must all have unique names in
  #    regards to that User.
  #  - If a Blog is destroyed then all Comments associated with that blog will
  #    also be destroyed

  def change
    create_table :blogs do |t|
      t.string :title, null: false 
      t.text :body, null: false 
      t.integer :author_id , null: false 
      
      t.timestamps
    end
  end
end
