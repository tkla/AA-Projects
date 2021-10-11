class Report < ApplicationRecord
  validates :understanding, :improvement, presence: true
end
