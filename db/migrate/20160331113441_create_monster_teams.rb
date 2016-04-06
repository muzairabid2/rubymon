class CreateMonsterTeams < ActiveRecord::Migration
  def change
    create_table :monster_teams do |t|
      t.integer :monster_id
      t.integer :team_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
