require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  let (:user) { create(:user) }
  let (:wiki) { create(:wiki, user: user) }
  let (:collaborator) { create(:wiki_collaborator, wiki_id: wiki.id, user_id: user.id) }

  before(:each) do
    sign_in user
  end
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki_collaborator" do
      get :new
      expect(assigns(:wiki_collaborator)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increment collaborator by 1" do
      expect { post :create, params: {
        collaborator: {
          wiki_id: wiki.id, user_id: user.id
        }
      }}.to change(WikiCollaborator, :count).by(1)
    end
  end
end
