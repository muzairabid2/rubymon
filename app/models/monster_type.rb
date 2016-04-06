class MonsterType < ActiveRecord::Base
  validates_presence_of :name, :power, :weakness
  has_one :monster
end
