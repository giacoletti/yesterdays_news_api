class Article < ApplicationRecord
  include OrderableByTimestamp
  validates_presence_of :title, :body, :category
  belongs_to :category
end
