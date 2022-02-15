class CosmeticPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end   # => During the testing there was an error because there needs to be an end here
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
