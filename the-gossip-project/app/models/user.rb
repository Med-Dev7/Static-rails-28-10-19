class User < ApplicationRecord
    belongs_to :city, optional: true 
    has_many :gossips
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
    has_many :comments

    has_secure_password

    # validates :name, length: { minimum: 2 }
    # validates :bio, length: { maximum: 500 }
    # validates :password, length: { in: 6..20 }
    # validates :registration_number, length: { is: 6 }
    # validates :email,
    # presence: true,
    # #uniqueness: true,
    # length: { minimum: 6} 
    # format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    
    # validates :first_name,
    # length: { in: 3..12 },
    # presence: true

    # validates :description, 
    # length: { maximum: 500}
    
    
end
