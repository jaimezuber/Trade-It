class TradeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.newTrade.subject
  #
  def newTrade
    @user = params[:user]
    @trade = params[:trade]

    mail(to: @user.subscriber.email, subject: 'Tenés un nuevo trade')
  end
end
