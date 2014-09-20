class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
      t.string :goal
      t.string :type
      t.string :achieved
      t.references :user, index: true

      t.timestamps
    end
  end
end
