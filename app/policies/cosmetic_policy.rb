class CosmeticPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def update?
      user == current_user
    end

    def create?
      true
    end
  end
end
