class ChangeDetatypeAccountNameOfUsers < ActiveRecord::Migration[6.1]
  def change
    # change_column :テーブル名, :カラム名, :データ型
    change_column :users, :account_name, :integer
  end
end
