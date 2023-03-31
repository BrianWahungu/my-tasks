class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :reminders
    attribute :title, :string

    # enum :status, [ :CREATED, :STARTED, :COMPLETED, :CANCELLED ]
    # enum :priority, [ :LOW, :MEDIUM, :HIGH ]

    validates :name, {
    length: { minimum: 5, maximum: 20 },
    presence: true
    }

    validates :description, {
    length: { minimum: 20 },
    presence: true
    }

end
