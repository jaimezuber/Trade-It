# Preview all emails at http://localhost:3000/rails/mailers/position_mailer
class PositionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/position_mailer/newTrade
  def newTrade
    @user = params[:user]
    @position = @user.positions.last
    PositionMailer.with(user: @user, position: @position).newTrade.deliver_now
  end

end
