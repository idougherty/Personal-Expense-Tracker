class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.date :date
      t.string :classification

      t.timestamps
    end
  end
end
