require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let (:user) { create(:user, role: 'premium') }
  let (:wiki) { create(:wiki, user: user, private: true) }

  describe "user downgrade from premium" do
    it "user downgrades to standard" do
      delete :downgrade, params: { id: user.id }
      expect(user.role).to eq('standard')
      expect(wiki.private).to eq(false)
      expect(response).to redirect_to root_path
    end
  end
end
