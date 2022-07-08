class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      user_id :integer, null: false
      location_id :integer, null: false
      
      t.timestamps
    end
  end
end
