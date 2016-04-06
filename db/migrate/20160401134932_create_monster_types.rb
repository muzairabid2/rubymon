class CreateMonsterTypes < ActiveRecord::Migration
  def change
    create_table :monster_types do |t|
      t.string :name
      t.string :power
      t.string :weakness

      t.timestamps null: false
    end
  end
end
