require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  let :user { FactoryGirl.create( :user ) }

  describe "GET #index" do
    it "blocks unauthorized users" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it "allows authorized users" do
      sign_in(user)
      get :index
      expect(response).to be_success
    end
  end

end
