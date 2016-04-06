# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#Database default values for Monster types

MonsterType.create(:name => 'fire', :power => 'water', :weakness => 'fire')
MonsterType.create(:name => 'water', :power => 'water', :weakness => 'fire')
MonsterType.create(:name => 'earth', :power => 'earth', :weakness => 'electric')
MonsterType.create(:name => 'electric', :power => 'earth', :weakness => 'electric')
MonsterType.create(:name => 'wind', :power => 'wind', :weakness => 'fire')
