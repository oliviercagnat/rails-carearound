class CosmeticPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

  def update?
    true
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    true
  end
end
