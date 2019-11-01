class Gossip < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :joinTagToGossips
    has_many :gossips, through: :joinTagToGossips


    validates :title,
    presence: true,
    uniqueness: true
    
    validates :content, presence: true
   
end
