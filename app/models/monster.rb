class Monster < ActiveRecord::Base
  validates_presence_of :name, :monster_type_id
  belongs_to :monster_type

  has_many :monster_teams
  has_many :teams, :through => :monster_teams

end
