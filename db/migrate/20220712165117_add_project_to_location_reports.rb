class AddProjectToLocationReports < ActiveRecord::Migration[6.1]
  def change
    add_column :location_reports, :latitude, :float
    add_column :location_reports, :longitude, :float
  end
end
