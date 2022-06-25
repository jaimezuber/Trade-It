class BiosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @bios = Bio.all
  end

  def show
    @bio = Bio.find(params[:id])
  end
end
