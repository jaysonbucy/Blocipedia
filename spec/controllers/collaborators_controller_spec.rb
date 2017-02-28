require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  let (:user) { create(:user) }
  let (:wiki) { create(:wiki, user: user) }
  let (:collaborator) { create(:collaborator, wikis_id: wiki.id, user_id: user.id) }

  describe "POST create" do
    it "increment collaborator by 1" do
      expect( -> { post :create, params: { collaborator: collaborator }}).to change(Collaborator, :count).by(1)
    end
  end
end
