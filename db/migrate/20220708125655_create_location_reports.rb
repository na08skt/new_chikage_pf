class CreateLocationReports < ActiveRecord::Migration[6.1]
  def change
    create_table :location_reports do |t|
      t.integer :user_id
      t.integer :comment_id
      t.string :title, null: false
      t.string :area, null: false
      t.text :address, null: false
      # 緯度
      t.decimal :latitude, null: false
      # 経度
      t.decimal :longitude, null: false
      t.date :date, null: false
      t.string :event
      t.string :body, null: false
      # 退会ステータスと同様、trueの場合に非公開にする。
      t.boolean :publication_status, null: false, default: false

      t.timestamps
    end
  end
end
