class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true 
    
    has_many :blogs,
        foreign_key: :author_id,
        primary_key: :id,
        class_name: :Blog

    has_many :comments,
        primary_key: :id,
        foreign_key: :author_id, 
        class_name: :Comment 
        
    has_many :comments_on_blogs,
        through: :blogs, 
        source: :comments
    
    has_many :blogs_commented_on,
        through: :comments,
        source: :blog 
end