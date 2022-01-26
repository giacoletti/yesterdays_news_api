class Api::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :validate_params_presence, only: [:create]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def index
    articles = if params['category'].nil?
                 Article.by_recently_created.limit(20)
               else
                 category = Category.where name: params['category']
                 Article.where(category: category).by_recently_created.limit(20)
               end
    render json: articles, each_serializer: Article::IndexSerializer
  end

  def show
    article = Article.find(params['id'])
    render json: article, serializer: Article::ShowSerializer
  rescue ActiveRecord::RecordNotFound => e
    render_error('Article not found', 404)
  end

  def create
    authorize Article.create
    article = Article.create(article_params)
    article.category = Category.find_by name: params['article']['category']
    article.user = User.find_by email: params['article']['user']
    article.save
    if article.persisted?
      render json: { article: article, message: 'Article created successfully' }, status: 201
    else
      render_error(article.errors.full_messages.to_sentence, 422)
    end
  end

  private

  def render_error(message, status)
    render json: { message: message }, status: status
  end

  def article_params
    params[:article].permit(:title, :body)
  end

  def validate_params_presence
    if params[:article].nil?
      render_error('Missing params', :unprocessable_entity)
    elsif params[:article][:title].nil?
      render_error("Title can't be blank", :unprocessable_entity)
    elsif params[:article][:body].nil?
      render_error("Body can't be blank", :unprocessable_entity)
    elsif params[:article][:category].nil?
      render_error("Category can't be blank", :unprocessable_entity)
    end
  end

  def user_not_authorized
    render json: { message: 'no no!' }, status: 401
  end
end
