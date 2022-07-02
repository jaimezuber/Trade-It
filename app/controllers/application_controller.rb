class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :check_bio
  skip_before_action :check_bio, if: :devise_controller?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def check_bio
    if current_user&.bio.nil?
      flash[:notice] = 'Finish setting your profile'
      redirect_to new_bio_path
    end
  end

  def after_sign_up_path_for(_resource)
    # return the path based on resource
    new_bio_path
  end

  def after_sign_in_path_for(_resource)
    # return the path based on resource
    bios_path
  end
end
