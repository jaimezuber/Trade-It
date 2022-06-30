class PositionsController < ApplicationController
  def index
    @positions = policy_scope(Position).select do |position|
      position.subscription.subscriber == current_user
    end
    @trades = current_user.trades
  end
end
