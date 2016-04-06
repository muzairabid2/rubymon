#Monster Type model validation spec
require 'spec_helper'

describe MonsterType do

  describe "creation" do

    context "valid attributes" do

      it "should be valid" do
        monster_type = MonsterType.new(name: "Water", power: "Water", :weakness =>  "Fire")

        monster_type.should be_valid
      end

    end

    context "invalid attributes" do

      it "should not be valid" do
        monster_type = MonsterType.new(name: "Water", power: "", :weakness =>  "")

        monster_type.should_not be_valid
      end

    end

  end

end