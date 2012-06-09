require 'spec_helper'
require 'maildir'
# require 'Mailman'

def send_test_mail
  @mail = Mail.new(from: @from_address, to: @to_address, subject: @subject, body: @body)
  @sent = @maildir.add(@mail)
  sleep 2
end

describe "ReceivedMail" do

  before(:each) do
      @maildir = Maildir.new('tmp/test_maildir')
      @maildir.serializer = Maildir::Serializer::Mail.new

      @other_variable = Object.new
  end

  describe "Mail received by the mailman server" do
    before(:each) do
      @from_address = 'from@linuxnus.org'
      @to_address = 'to@default.com'
      @subject = 'default subject'
      @body = 'default body text'
    end

    describe "should only accept command emails from a whitelist" do
      pending
      # send_test_mail
      # terrible messy tests, not done yet.

      it "should accept commands in the subject line of direct emails"
      it "should parse the first line of the body of other emails"
    end

    it "should queue up emails that don't match an explicit rule"

  end
end
