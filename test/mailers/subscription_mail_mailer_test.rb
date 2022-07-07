require "test_helper"

class SubscriptionMailMailerTest < ActionMailer::TestCase
  test "new_subscription" do
    mail = SubscriptionMailMailer.new_subscription
    assert_equal "New subscription", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
