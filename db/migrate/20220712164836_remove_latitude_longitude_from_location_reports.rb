class RemoveLatitudeLongitudeFromLocationReports < ActiveRecord::Migration[6.1]
  def change
    remove_column :location_reports, :longitude, :float
    remove_column :location_reports, :latitude, :float
  end
end

