class ChangeDetatypeAccountNameOfUsersSecound < ActiveRecord::Migration[6.1]
  def change
    change_column :Users, :account_name, :string
  end
end
