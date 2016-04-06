#Monster Team model validation spec
require 'spec_helper'

describe MonsterTeam do

  describe "creation" do

    context "valid attributes" do

      it "should be valid" do
        monster_team = MonsterTeam.new(monster_id: 1, team_id: 1)

        monster_team.should be_valid
      end

    end

    context "invalid attributes" do

      it "should not be valid" do
        monster_team = MonsterTeam.new(monster_id: "", team_id: "")

        monster_team.should_not be_valid
      end

    end

  end

end


