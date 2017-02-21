class UserPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
      @user = user
      @wiki = wiki
  end

  def update
   @wiki.user.id or @user.admin?
  end

  def edit
    update?
  end
end
