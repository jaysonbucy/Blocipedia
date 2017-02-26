require 'rails_helper'

RSpec.describe WikiPolicy do

  subject { WikiPolicy.new(user, wiki) }
  let :this_wiki { create(:wiki) }

  # context "for a guest" do
  #   let :user { nil }
  #
  #   it "renders the #show view" do
  #     get :show, params: { id: this_wiki.id }
  #     expect(assigns(:wiki)).to eq(this_wiki)
  #   end
  # end
end
