class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.float :balance
      t.string :type
      t.date :date

      t.timestamps
    end
  end
end
