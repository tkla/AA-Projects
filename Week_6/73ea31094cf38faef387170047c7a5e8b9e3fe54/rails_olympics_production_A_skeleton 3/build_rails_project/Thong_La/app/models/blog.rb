  # `Blogs` will have a `title` which is a string, a `body` which is text, and
  #  will belong to a `User` (name this column `author_id`).
  #  - A User has many blogs, but those blogs must all have unique names in
  #    regards to that User.
  #  - If a Blog is destroyed then all Comments associated with that blog will
  #    also be destroyed
class Blog < ApplicationRecord
    validates :title, uniqueness: {scope: :author_id}, presence: true 
    validates :body, presence: true 

    belongs_to :author,
      foreign_key: :author_id,
      primary_key: :id,
      class_name: :User

    has_many :comments,
        dependent: :destroy 
end
