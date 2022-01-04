class TransactionController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
    end

    def update
        @transaction = Transaction.find(params[:transaction_id]);
        
        @account = Account.where(name: params[:account_type])[0]
        puts params
        
        @transaction[:amount] = params[:amount];
        @transaction[:classification] = params[:category];
        @transaction[:date] = params[:date];
        @transaction[:account_id] = @account[:id];

        respond_to do |format|
            if @transaction.save
                format.html { redirect_to transactions_url, notice: "Transaction was successfully updated." }
            else
                format.html { render :index, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @transaction = Transaction.find params[:transaction_id]
        @transaction.destroy

        @account = Account.find(@transaction[:account_id])
        account[:balance] -= transaction[:amount]

        respond_to do |format|
            if(accound.save)
                # TODO: subtract balance from account
                format.html { redirect_to transactions_url, notice: "Transaction was successfully deleted." }
                # redirect_back(fallback_location: root_path)
            end
        end
    end

    before_action :run_query
    def run_query
        @transactions = Transaction.all
        @accounts = Account.all
        
        account_id = nil
        
        if(params[:account_name] != "" && params[:account_name] != nil)
            account_id = Account.where(name: params[:account_name])[0][:id]
        end

        @queried_transactions = Transaction.where.not(amount: nil)

        if(account_id)
            @queried_transactions = @queried_transactions.where(account_id: account_id)
        end

        if(params[:category] != "" && params[:category] != nil)
            @queried_transactions = @queried_transactions.where(classification: params[:category])
        end

        if(params[:minAmount] != "" && params[:minAmount] != nil)
            @queried_transactions = @queried_transactions.where("amount >= ?", params[:minAmount])
        end

        if(params[:maxAmount] != "" && params[:maxAmount] != nil)
            @queried_transactions = @queried_transactions.where("amount <= ?", params[:maxAmount])
        end

        if(params[:minDate] != "" && params[:minDate] != nil)
            @queried_transactions = @queried_transactions.where("date >= ?", params[:minDate])
        end

        if(params[:maxDate] != "" && params[:maxDate] != nil)
            @queried_transactions = @queried_transactions.where("date <= ?", params[:maxDate])
        end

        limit = 20
        
        if(params[:count] != "" && params[:count] != nil)
            limit = params[:count]
        end

        @queried_transactions = @queried_transactions.take(limit)
    end
end
