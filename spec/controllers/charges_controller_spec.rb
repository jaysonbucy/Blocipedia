require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  describe "POST #create" do
    it "creates a customer with Stripe" do
      user = create(:user)
      sign_in user

      allow(Stripe::Charge).to receive(:create)
      
      customer = double(id: 1)
      expect(Stripe::Customer).to receive(:create).with({
        email: user.email,
        card: 'my_cool_token'
      }).and_return(customer)

      post :create, params: {
        stripeToken: "my_cool_token"
      }
    end
  end
end
