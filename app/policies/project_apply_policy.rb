class ProjectApplyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.is_a?(User) && !user.project_applies.collect(&:project_id).include?(record.project.id)
  end

  alias_method :create?, :new?
end
