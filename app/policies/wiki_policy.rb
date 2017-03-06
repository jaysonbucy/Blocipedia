class WikiPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || user.admin?
  end

  def edit?
    update?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def intialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.user_id == user.id || wiki.collaborators.ids.include?(user.id)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
