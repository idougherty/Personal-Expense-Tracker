class HomeController < ApplicationController
    def index
    end

    def createTransaction
        @account = Account.where(name: params[:account_name])[0]

        @new_transaction = Transaction.new
        @new_transaction[:amount] = params[:amount]
        @new_transaction[:classification] = params[:category]
        @new_transaction[:date] = params[:date]
        @new_transaction[:account_id] = @account[:id]

        respond_to do |format|
            if @new_transaction.save
                @account[:balance] -= @new_transaction[:amount]
                @account.save
                format.html { render :index, notice: "Transaction was successfully created." }
            else
                format.html { render :index, status: :unprocessable_entity }
            end
        end
    end


    before_action :set_vars
    def set_vars
        start_date = 1.month.ago

        @transactions = Transaction.where("date >= ?", start_date)
        @accounts = Account.all
        
        @total_balance = 0;
        for account in @accounts do
            @total_balance += account[:balance]
        end
        
        @month_income = 0;
        @month_expense = 0;
        for transaction in @transactions do
            if(transaction[:amount] > 0)
                @month_income += transaction[:amount]
            else
                @month_expense -= transaction[:amount]
            end
        end
    end
end