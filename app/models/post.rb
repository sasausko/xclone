class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  
  # Дозволяємо створення поста з користувачем
  accepts_nested_attributes_for :user
end
