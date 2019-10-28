class Tag < ApplicationRecord
    has_many :joinTagToGossips
    has_many :tags, through: :joinTagToGossips
end
