# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :string           not null
#  moderator   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true 
    validates :moderator, :description, presence: true 

    belongs_to :creator, 
        foreign_key: :moderator,
        class_name: :User 
end
