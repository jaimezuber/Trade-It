class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :check_bio, only: [ :home ]

  def home
  end
end
