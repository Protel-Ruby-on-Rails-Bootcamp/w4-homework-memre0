class Post < ApplicationRecord

    has_many :comments, dependent: :destroy
    belongs_to :user
    
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true

    scope :availables, -> { where(status: true) }
end
