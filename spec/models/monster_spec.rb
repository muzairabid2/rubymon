#Monster model validation spec

require 'spec_helper'

describe Monster do

  describe "creation" do

    context "valid attributes" do

      it "should be valid" do
        post = Monster.new(name: "My first post", monster_type_id: 1)

        post.should be_valid
      end

    end

    context "invalid attributes" do

      it "should not be valid" do
        post = Monster.new(name: "My first post", monster_type_id: "")

        post.should_not be_valid
      end

    end

  end

end