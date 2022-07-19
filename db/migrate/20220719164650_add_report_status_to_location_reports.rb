class AddReportStatusToLocationReports < ActiveRecord::Migration[6.1]
  def change
    add_column :location_reports, :report_status, :boolean, default: false, null: false
  end
end
