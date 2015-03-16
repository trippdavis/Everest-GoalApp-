class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.text :description, null: false
      t.string :status, null: false
      t.string :shared_status, null: false

      t.timestamps null: false
    end
    add_index(:goals, :user_id)
  end
end
