require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WikisHelper. For example:
#
# describe WikisHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe WikisHelper, type: :helper do
  describe "#new_line_to_html" do
    it "replaces new line characters with html breaks" do
      body = "This is text with new line.\n We expect it to return a break."
      new_body = "This is text with new line.<br> We expect it to return a break."

      expect(helper.new_line_to_html(body)).to eq(new_body)
    end
  end
end
