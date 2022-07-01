class BioPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    user.bio.nil?
  end

  def show?
    true
  end

  def profile?
    true
  end
end
