class CreateActors < ActiveRecord::Migration[8.1]
  def change
    create_table :actors do |t|
      t.timestamps
      t.string "actor_name"
      t.integer "agent_id"
    end
  end
end
