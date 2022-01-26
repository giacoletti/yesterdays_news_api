class Article < ApplicationRecord
  include OrderableByTimestamp
  validates_presence_of :title, :body, :category_id
  belongs_to :category
  belongs_to :user
  has_one_attached :image
end
