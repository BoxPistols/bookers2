class Book < ApplicationRecord
  belongs_to :user

  attachment :image

  validates :title, presence: true, length: { maximum: 20}
  validates :body, presence: true, length: { maximum: 200}
  validates :image, presence: false
end
