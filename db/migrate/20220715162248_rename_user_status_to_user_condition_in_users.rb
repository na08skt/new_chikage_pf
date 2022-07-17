class RenameUserStatusToUserConditionInUsers < ActiveRecord::Migration[6.1]
  def up
    rename_column :users, :user_status, :user_condition
  end

  def down
    rename_column :users, :user_condition, :user_status
  end
end
