class Team < ActiveRecord::Base
  validates_presence_of :name, :user_id
  has_many :monster_teams
  has_many :monsters, :through => :monster_teams
end
