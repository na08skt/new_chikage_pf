class CreateLocationReports < ActiveRecord::Migration[6.1]
  def change
    create_table :location_reports do |t|
      user_id :integer
      comment_id :integer
      title :string, null: false
      area :string, null: false
      address :text, null: false
      # 緯度
      latitude :decimal, null: false
      # 
      
      longitude :decimal, null: false
      date :date, null: false
      event :string
      body :string, null: false 
      # 退会ステータスと同様、trueの場合に非公開にする。
      publication_status :boolean, null: false, default: false

      t.timestamps
    end
  end
end
