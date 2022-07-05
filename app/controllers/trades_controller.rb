class TradesController < ApplicationController
  def new
    @trade = Trade.new
    authorize @trade
  end

  def create
    @trade = Trade.new(rev_params)
    @trade.trader = current_user

    authorize @trade

    if @trade.save
      flash[:notice] = "Tradeado con exito"
      redirect_to bios_path
      @trade.trader.subscriptions.each do |subscriber|
        TradeMailer.with(user: subscriber, trade: @trade).newTrade.deliver_now
      end



    else
      render :new
    end
  end

  private

  def rev_params
    params.require(:trade).permit(:symbol, :entry_price, :take_profit, :stop_loss, :side)
  end
end
