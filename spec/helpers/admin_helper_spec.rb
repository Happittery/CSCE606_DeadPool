require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AdminHelper. For example:
#
# describe AdminHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AdminHelper, type: :helper do
    before(:each) do
    @user1 = FactoryGirl.create(:user, email: "niloofar@example.com")
    @user2 = FactoryGirl.create(:user, email: "zarei@example.com")
    @user3 = FactoryGirl.create(:user, email: "zarei2@example.com")
    @user1.add_role(:admin)
    @user2.add_role(:admin)
    @user3.add_role(:guest)
    #sign_in @user1
  end

  
  #pending "add some examples to (or delete) #{__FILE__}"
end
