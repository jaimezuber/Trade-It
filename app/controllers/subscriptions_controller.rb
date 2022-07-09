class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[edit update unsubscribe]
  before_action :check_balances, only: %i[new create]

  def index
    @subscriptions_trader = policy_scope(Subscription).select do |subscription|
      subscription.trader == current_user
    end

    @subscriptions_subscriber = policy_scope(Subscription).select do |subscription|
      subscription.subscriber == current_user
    end
  end

  def new
    @trader = User.find(params[:user_id])
    @subscription = Subscription.new
    @subscription.trader = @trader

    authorize @subscription
  end

  def create
    @subscription = Subscription.new(rev_params)
    @trader = User.find(params[:user_id])
    @subscription.subscriber = current_user
    @subscription.trader = @trader

    authorize @subscription

    if @balance < @subscription.max_amount
      flash[:alert] = "Tu balance en Binance es de #{@subscription.max_amount}"
      render :new
    elsif @subscription.save
      flash[:notice] = "Ya estas suscripto a #{@trader.bio.username}"
      redirect_to bio_path(@trader.bio)
      SubscriptionMailMailer.with(subscriber: @subscription.subscriber, trader: @subscription.trader).new_subscription.deliver_now
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subscription.update(rev_params)
      flash[:notice] = 'Subscription editado'
      redirect_to bio_path(@subscription.trader.bio)
    else
      render :edit
    end
  end

  def unsubscribe
    @subscription.status = false
    render :index
  end

  private

  def rev_params
    params.require(:subscription).permit(:amount_per_trade, :max_amount)
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
    authorize @subscription
  end

  def check_balances
    @balance = 100
  end
end
