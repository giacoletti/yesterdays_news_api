class Article::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :teaser, :published, :category, :user, :image

  def published
    object.created_at.to_formatted_s(:long)
  end

  def category
    object.category.name.humanize
  end

  def teaser
    object.body[0, 60] + '...'
  end

  def user
    object.user.email
  end

  def image
    {
      id: id,
      title: title,
      image: if Rails.env.test?
               ActiveStorage::Blob.service.path_for(image.key)
             else
               image.service_url(expires_in: 1.hour,
                                 disposition: 'inline')
             end
    }
  end
end
