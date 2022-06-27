class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
    # Creo que voy a necesitar esto si hago un resources anidado @trader = User.find(params[:id])
  end

  def create
    @subscription = Subscription.create(rev_params)
    @trader = params # Ver como como pasarle el trader en los params
    @subscription.subscriber = current_user
    @subscription.trader = @trader
    if @subscription.save
      flash[:notice] = "Ya estas suscripto a #{@trader.bio.username}"
      redirect_to bio_path(@trader)
    else
      render :new
    end
  end

  private

  def rev_params
    params.require(:subscription).permit(:amount_per_trade, :max_amount)
  end
end
