class Article::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :category, :published, :author

  def published
    object.created_at.to_formatted_s(:long)
  end

  def category
    object.category.name.humanize
  end

  def author
    object.user.name
  end
end
