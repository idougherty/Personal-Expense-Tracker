class Account < ApplicationRecord
    has_many :transactions, class_name: "Transaction", foreign_key: "account_id"
    belongs_to :user
    
    attr_accessor :balance, :type, :date

    def editType=(type)
        self[:type] = type
    end

    def editDate=(date)
        self[:date] = date
    end
end
