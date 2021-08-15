# `Comments` will have a `body` which is a string, and will belong to both a
#    `User` (name this column `author_id`). and a `Blog` (name this column
#    `blog_id`).

class Comment < ApplicationRecord
    validates :body, presence: true 

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id, 
        class_name: :User  

    belongs_to :blog 
end
