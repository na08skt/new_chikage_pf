class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      user_id :integer, null: false
      location_report_id :integer, null: false
      body :text, null: false
      
      t.timestamps
    end
  end
end
