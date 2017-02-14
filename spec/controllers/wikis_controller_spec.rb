require 'rails_helper'

include SessionsHelper

RSpec.describe WikisController, type: :controller do
  let :my_user { create(:user) }
  let :my_wiki { create(:wiki, user: my_user) }

  context "signed-in user" do
    before do
      sign_in my_user
      create_session(my_user)
    end

    describe "GET new" do
      it "returns http success" do
        get :new, params: { wiki_id: my_wiki.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, params: { wiki_id: my_wiki.id }
        expect(response).to render_template(:new)
      end
    end

    describe "GET show" do
      
    end

    describe "GET edit" do

    end

    describe "POST create" do

    end

    describe "PUT update" do

    end

    describe "DELETE destroy" do

    end
  end
end
