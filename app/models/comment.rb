class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }
end
