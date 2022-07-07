# Preview all emails at http://localhost:3000/rails/mailers/subscription_mail_mailer
class SubscriptionMailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscription_mail_mailer/new_subscription
  def new_subscription
    SubscriptionMailMailer.new_subscription
  end

end
