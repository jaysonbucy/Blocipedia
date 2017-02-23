class WikiPolicy < ApplicationPolicy
  def update?
   record.user_id == user.id || user.admin?
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
