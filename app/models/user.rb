class User < ApplicationRecord
    has_many :tasks
    has_many :categories
    has_secure_password
    attribute :name, :string

    validates :username, { length: {minimum: 5, maximum: 8}, 
    uniqueness: true,
    presence: true 
    }

    validates :email, {
    uniqueness: true,
    presence: true
    }
end
