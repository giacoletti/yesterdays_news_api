class ArticlePolicy < ApplicationPolicy
  def create?
    @user&.is_staff?
  end

  def index?
    true
  end

  def show?
    true
  end
end
