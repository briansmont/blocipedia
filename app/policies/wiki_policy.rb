class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki_params
  
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end
  
  def update?
    user.present?
  end
  
  def new?
    user.present?
  end
  
  def create?
    user.present?
  end
  
  def show?
    user.present?
  end
  
  def edit?
    user.present?
  end
  
  def destroy?
    user.admin?
  end
end