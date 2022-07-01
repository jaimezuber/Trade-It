class ExchangesController < ApplicationController
  before_action :set_exchange, only: %i[edit update]

  def new
    @exchange = Exchange.new
    @user_id = params[:format]
    authorize @exchange
  end

  def create
    @exchange = Exchange.new(rev_params)
    @exchange.user = current_user
    authorize @exchange
    if @exchange.save
      flash[:notice] = 'Exchange guardado'
      if params[:user_id].nil?
        redirect_to profile_path
      else
        redirect_to new_user_subscription_path(User.find(params[:user_id]))
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @exchange.update(rev_params)
      flash[:notice] = 'Exchange editado'
      redirect_to bios_path
    else
      render :edit
    end
  end

  private

  def rev_params
    params.require(:exchange).permit(:name, :write_key, :read_key)
  end

  def set_exchange
    @exchange = Exchange.find(params[:id])
    authorize @exchange
  end
end
