class ChangeDetatypeAccountNameOfUsersSecound < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :account_name, :string
  end
end
