class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    array = record.trader.subscriptions.select { |subscription| subscription.subscriber == user }
    array.empty?
  end

  def update?
    record.user == user
  end
end
