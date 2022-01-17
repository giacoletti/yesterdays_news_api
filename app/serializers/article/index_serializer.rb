class Article::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :published, :category

  def published
    object.created_at
  end

  def category
    object.category.humanize
  end
end
