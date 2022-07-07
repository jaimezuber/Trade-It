class SubscriptionMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mail_mailer.new_subscription.subject
  #
  def new_subscription
    @subscriber = params[:subscriber]
    @trader = params[:trader]

    mail(to: @trader.email, subject: 'Tenés una nueva suscripción')
  end
end
