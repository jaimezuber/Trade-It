class PositionsController < ApplicationController
  def index
    @positions = policy_scope(current_user.positions)
    @trades = current_user.trades
    @recent_trades = current_user.trades.where.not(pnl: nil).order(created_at: :desc).limit(3).map(&:pnl)

    require 'json'
    require 'rest-client'
    url = 'https://testnet.binancefuture.com/fapi/v1/premiumIndex'

    response = RestClient.get url
    @result = JSON.parse response.to_str
  end
end
