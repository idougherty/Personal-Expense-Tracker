class UserController < ApplicationController
    def getMonthsExpenditure
        lastMonth = (Date.today - 1.month)
        transactions = self.queryTransactionsByDate(lastMonth, nil)

        sum = 0
        for transaction in transactions
            if(transaction.amount < 0)
                sum += 1
            end
        end

        return sum
    end
    
    def getMonthsIncome
        lastMonth = (Date.today - 1.month)
        transactions = self.queryTransactionsByDate(lastMonth, nil)

        sum = 0
        for transaction in transactions
            if(transaction.amount > 0)
                sum += 1
            end
        end

        return sum
    end

    def queryTransactionsByDate(start_date, end_date)
        if(start_date == nil)
            start_date = Date.new(1970, 1, 1)
        end

        if(end_date == nil)
            end_date = Date.today
        end

        return self.transactions.where('date > ? AND date < ?', start_date, end_date)
    end

    def generateReport
        
    end
end