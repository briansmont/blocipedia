class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end
  
  def update?
    user.present? || user.admin?
  end
  
  def new?
    user.present? || user.admin?
  end
  
  def create?
    user.present? || user.admin?
  end
  
  def show?
    user.present? || !user.present?
  end
  
  def edit?
    user.present? || user.admin?
  end
  
  def destroy?
    user.admin?
  end
end