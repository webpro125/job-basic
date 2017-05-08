class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def apply_possible?
    user.is_a?(User) && user.project_applies.collect(&:project_id).include?(record.id)
  end
end
