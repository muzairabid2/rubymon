class MonsterTeam < ActiveRecord::Base
  validates_presence_of :team_id, :monster_id
  belongs_to :monster
  belongs_to :team
end
