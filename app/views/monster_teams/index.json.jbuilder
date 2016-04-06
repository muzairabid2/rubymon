json.array!(@monster_teams) do |monster_team|
  json.extract! monster_team, :id, :monster_id, :team_id, :user_id
  json.url monster_team_url(monster_team, format: :json)
end
