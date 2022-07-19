class BioPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all.order(rendimiento: :desc)
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

  def update?
    true
  end

  def subscriptors?
    true
  end

  def subscribers?
    true
  end

end
