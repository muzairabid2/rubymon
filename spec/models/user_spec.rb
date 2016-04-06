#User model validation spec
require 'spec_helper'

describe User do

  describe "creation" do

    context "valid attributes" do

      it "should be valid" do
        user = User.new(email: "uzair.abid@whiterabbit.is", :password => '$2a$10$5jTZg9mepwHImvlEPgAGWejFekhw0wjPX9O2QAfWlx8NoAml7Q9N2', :authentication_token => "sasdasds")

        user.should be_valid
      end

    end

    context "invalid attributes" do

      it "should not be valid" do
        user = User.new(email: "", :password => "")

        user.should_not be_valid
      end

    end

  end

end