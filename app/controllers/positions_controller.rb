class PositionsController < ApplicationController
  def index
    @positions = policy_scope(current_user.positions)
    @trades = current_user.trades
    @recent_trades = current_user.trades.where.not(pnl: nil).order(created_at: :desc).limit(3).map(&:pnl)

    response = RestClient.get 'https://testnet.binancefuture.com/fapi/v1/premiumIndex'
    @result = JSON.parse response.to_str
  end
end
