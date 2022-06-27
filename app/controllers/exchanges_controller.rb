class ExchangesController < ApplicationController
  before_action :set_exchange, only: %i[edit update]

  def new
    @exchange = Exchange.new
    authorize @exchange
  end

  def create
    @exchange = Exchange.create(rev_params)
    @exchange.user = current_user
    authorize @exchange
    if @exchange.save
      flash[:notice] = 'Exchange guardado'
      redirect_to bios_path
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
