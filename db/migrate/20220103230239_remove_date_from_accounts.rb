class RemoveDateFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :date, :date
  end
end
