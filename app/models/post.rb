class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  
  accepts_nested_attributes_for :user
end
