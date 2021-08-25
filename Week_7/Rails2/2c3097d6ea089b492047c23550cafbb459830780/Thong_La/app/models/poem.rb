class Poem < ApplicationRecord
    validates :title, :stanzas, presence: true
    validates :complete, inclusion: [true,false]

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User 
end
