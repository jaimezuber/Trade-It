class PositionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.position_mailer.newTrade.subject
  #
  def newTrade
    @user = params[:user]
    @positions = policy_scope(@user.positions)

    mail(to: @user.email, subject: 'Tenes un nuevo trade!')
  end
end
