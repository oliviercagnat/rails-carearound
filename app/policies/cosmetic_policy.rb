class CosmeticPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end   # => During the testing there was an error because there needs to be an end here

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

  def search?
    true
  end
end
