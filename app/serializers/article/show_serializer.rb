class Article::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :category, :published

  def published
    object.created_at
  end

  def category
    object.category.humanize
  end
end
