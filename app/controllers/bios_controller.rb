class BiosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def new
    @bio = Bio.new
    authorize @bio
  end

  def create
    @bio = Bio.new(rev_params)
    @bio.user = current_user
    authorize @bio
    if @bio.save
      flash[:notice] = 'Account set'
      redirect_to bios_path
    else
      render
    end
  end

  def index
    @bios = policy_scope(Bio).reject do |bio|
      bio.user.trades.empty?
    end
  end

  def show
    @bio = Bio.find(params[:id])
    authorize @bio

    require 'json'
    require 'rest-client'
    url = 'https://api.exchange.ripio.com/api/v1/rate/all/'

    response = RestClient.get url
    @result = JSON.parse response.to_str
  end

  private

  def rev_params
    params.require(:bio).permit(:username, :description, :photo)
  end
end
