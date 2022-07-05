require "test_helper"

class TradeMailerTest < ActionMailer::TestCase
  test "newTrade" do
    mail = TradeMailer.newTrade
    assert_equal "Newtrade", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
