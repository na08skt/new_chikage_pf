class ChangeLocationReportsLatitudeAndLongitudeToFloat < ActiveRecord::Migration[6.1]
  def up
    # change_column :<テーブル名>, :<カラム名>, :<新しい型>, using: "<カラム名>::<新しい型>"
    change_column :location_reports, :latitude, :float, using: "latitude::float"
    change_column :location_reports, :longitude, :float, using: "longitude::float"
  end
  def down
    # change_column :<テーブル名>, :<カラム名>, :<古い型>, using: "<カラム名>::<古い型>"
    change_column :location_reports, :latitude, :decimal, using: "latitude::decimal"
    change_column :location_reports, :longitude, :decimal, using: "longitude::decimal"
  end
end
