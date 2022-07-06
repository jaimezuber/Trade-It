class BiosController < ApplicationController
  before_action :find_bio, only: %i[show edit]
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_before_action :check_bio, only: %i[new create]
  def new
    @bio = Bio.new
    authorize @bio
  end

  def create
    @bio = Bio.new(bio_params)
    authorize @bio
    @bio.user = current_user
    if @bio.save
      flash[:notice] = 'Account set'
      redirect_to bios_path
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      @bios = policy_scope(Bio).search_by_username(params[:query]).reject do |bio|
        bio.user.trades.empty?
      end
    elsif params[:riesgo] == 'alto'
      @bios = policy_scope(Bio).select do |bio|
        if bio.volatilidad != 0.0
          if bio.volatilidad > 70
            bio.user.trades
          end
        end
      end
    elsif params[:riesgo] == 'medio'
      @bios = policy_scope(Bio).select do |bio|
        if bio.volatilidad != 0.0
          if bio.volatilidad > 40 && bio.volatilidad < 60
            bio.user.trades
          end
        end
      end
    elsif params[:riesgo] == 'bajo'
      @bios = policy_scope(Bio).select do |bio|
        if bio.volatilidad != 0.0
          if bio.volatilidad < 20
            bio.user.trades
          end
        end
      end
    else
      @bios = policy_scope(Bio).reject do |bio|
        bio.user.trades.empty?
      end
    end
  end

  def show
    @bio = Bio.find(params[:id])
    authorize @bio

    require 'json'
    require 'rest-client'
    url = 'https://testnet.binancefuture.com/fapi/v1/premiumIndex'

    response = RestClient.get url
    @result = JSON.parse response.to_str
  end

  def profile
    @bio = current_user.bio
    authorize @bio
  end

  def edit; end

  def update
    @bio = current_user.bio
    authorize @bio
    if @bio.update(bio_params)
      flash[:notice] = "Profile edited"
      redirect_to profile_path
    else
      render :profile
    end
  end

  private

  def bio_params
    params.require(:bio).permit(:username, :description, :photo)
  end

  def find_bio
    @bio = Bio.find(params[:id])
    authorize @bio
  end
end
