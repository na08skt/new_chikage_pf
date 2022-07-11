class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.integer :user_id, null: false
      t.integer :location_id, null: false
      
      t.timestamps
    end
  end
end
