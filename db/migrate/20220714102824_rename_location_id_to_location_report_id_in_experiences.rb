class RenameLocationIdToLocationReportIdInExperiences < ActiveRecord::Migration[6.1]
  def up
    rename_column :experiences, :location_id, :location_report_id
  end

  def down
    rename_column :experiences, :location_report_id, :location_id
  end
end
