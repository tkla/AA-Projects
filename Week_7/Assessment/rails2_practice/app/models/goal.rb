class Goal < ApplicationRecord
    validates :name, :details, presence: true 
    validates :user_id, presence: true 
    validates :status,  inclusion: [true, false]
    
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User 
end
