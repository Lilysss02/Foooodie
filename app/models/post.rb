class Post < ApplicationRecord
  belongs_to :price
  belongs_to :user
  has_many_attached :images
  has_many :favorites, dependent: :destroy

  has_and_belongs_to_many :tags
end
