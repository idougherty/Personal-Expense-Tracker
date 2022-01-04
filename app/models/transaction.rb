class Transaction < ApplicationRecord
    attr_accessor :amount, :date, :classification
    belongs_to :account

    def editAmount=(amt)
        self[:amount] = amt
    end

    def editDate=(date)
        self[:date] = date
    end

    def editClassification=(str)
        self[:classification] = str
    end
end
