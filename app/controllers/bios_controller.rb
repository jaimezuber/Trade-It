class BiosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @bios = Bio.all
  end

  def show
    @bio = Bio.find(params[:id])

    require 'json'
    require 'rest-client'
    url = 'https://api.exchange.ripio.com/api/v1/rate/all/'

    response = RestClient.get url
    @result = JSON.parse response.to_str



    
  end
end
