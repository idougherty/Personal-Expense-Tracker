class AccountController < ApplicationController
    def index
    end

    def addTransaction(amount, classification)
        Transaction.create(amount: amount, date: Date.today, classification: classification, account_id: self.id)
    end

    def getTransactions
        return self.transactions
    end
end
