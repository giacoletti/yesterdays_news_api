class ArticlePolicy < ApplicationPolicy
  
  def create?
    # @user && @user.is_staff?
    # @user.try(:is_staff?)
    @user&.is_staff?
  end

  def index?
    true
  end
  
  def show?
    true
  end
end
