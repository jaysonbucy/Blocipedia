require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let (:user) { create(:user, role: 'premium') }
  let (:wiki) { create(:wiki, user: user, private: true) }

  context "premium user" do
    before do
      sign_in(user)
    end

    describe "user downgrade from premium" do
      it "downgrades the user" do
        delete :downgrade, id: user.id
        binding.pry
        expect(user.role).to eq('standard')
        expect(wiki.private).to eq(false)
        expect(response).to redirect_to root_path
      end
    end
  end
end
