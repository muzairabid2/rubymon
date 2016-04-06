#Team model validation spec
require 'spec_helper'

describe Team do

  describe "creation" do

    context "valid attributes" do

      it "should be valid" do
        post = Team.new(name: "My first post", user_id: 1)

        post.should be_valid
      end

    end

    context "invalid attributes" do

      it "should not be valid" do
        post = Team.new(name: "My first post", user_id: "")

        post.should_not be_valid
      end

    end

  end

end