require "rails_helper"

RSpec.describe ApplicationMailer, type: :mailer do
  let(:user) { FactoryGirl.build(:user) }
  it "sends an email" do
    # ActiveRecord::Base.skip_callbacks = true
    # user.save
    # mailer = subject.new_user(user)
    # ActionMailer::Deliveries.count goes from 0 to 1
    #expect(mailer.subject).to eq("Your account for Blocipedia has been created.")
  end
end
