class Article < ApplicationRecord
  include OrderableByTimestamp
  validates_presence_of :title, :body, :category_id
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  def serialized
    binding.pry
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
  # 
  # This is how Thomas serialized the article in the index action. 
  # He also changed the index action to => render json: { articles: serialized_articles(articles) }, each_serializer: Article::IndexSerializer
  # If I did that it worked but it removed alot of other bodies in the article. 

end
