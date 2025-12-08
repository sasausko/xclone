class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_many_attached :images

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true

  accepts_nested_attributes_for :user
end
