class RemoveAccountIdFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :account_id, :int
  end
end
