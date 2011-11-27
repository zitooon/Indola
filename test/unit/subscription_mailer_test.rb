require File.dirname(__FILE__) + '/../test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  tests SubscriptionMailer
  def test_confirmation
    @expected.subject = 'SubscriptionMailer#confirmation'
    @expected.body    = read_fixture('confirmation')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SubscriptionMailer.create_confirmation(@expected.date).encoded
  end

end
