# Preview all emails at http://localhost:3000/rails/mailers/trade_mailer
class TradeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/trade_mailer/newTrade
  def newTrade
    TradeMailer.newTrade
  end

end
