class SubscriptionsController < ApplicationController
  def new
    @trader = User.find(params[:user_id])
    @subscription = Subscription.new
    @subscription.trader = @trader
  end

  def create
    @subscription = Subscription.create(rev_params)
    @trader = User.find(params[:user_id]) # Ver como como pasarle el trader en los params
    @subscription.subscriber = current_user
    @subscription.trader = @trader
    if @subscription.save
      flash[:notice] = "Ya estas suscripto a #{@trader.bio.username}"
      redirect_to bio_path(@trader.bio)
    else
      render :new
    end
  end

  private

  def rev_params
    params.require(:subscription).permit(:amount_per_trade, :max_amount)
  end
end
