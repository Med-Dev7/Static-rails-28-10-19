class Tag < ApplicationRecord
    has_many :joinTagToGossips
    has_many :tags, through: :joinTagToGossips
    validates :title,
    length: { in: 3..25 },
    presence: true,
    uniqueness: true
end
