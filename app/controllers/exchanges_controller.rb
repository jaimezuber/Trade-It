class ExchangesController < ApplicationController
  def new
    @exchange = Exchange.new
  end

  def create
    @exchange = Exchange.create(rev_params)
    @exchange.user = current_user
    if @exchange.save
      flash[:notice] = 'Exchange guardado'
      redirect_to bios_path
    else
      render :new
    end
  end

  private

  def rev_params
    params.require(:exchange).permit(:name, :write_key, :read_key)
  end
end
