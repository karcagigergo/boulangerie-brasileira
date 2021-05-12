class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  attr_reader :current_user, :role

  def initialize(current_user, role)
    @current_user = current_user
    @role = role
  end

  def create?
    true
  end
end
