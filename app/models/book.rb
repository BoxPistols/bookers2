class Book < ApplicationRecord
  belongs_to :user

  attachment :image

  validates :title, presence: true, length: { minimum: 2, maximum: 20}
  validates :body, presence: true, length: { minimum: 2, maximum: 200}
  validates :image, presence: false
end
