class AccountController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @accounts = Account.all
    end

    def show
    end

    def edit
    end
    
    def create
        @accounts = Account.all
        @new_account = Account.new

        if(params[:name])
            @new_account[:name] = params[:name]
            @new_account[:balance] = params[:balance]
        else
            @new_account[:name] = account_params[:name]
            @new_account[:balance] = account_params[:balance]
        end

        respond_to do |format|
            if @new_account.save
                format.html { render :index, notice: "Account was successfully created." }
            else
                format.html { render :index, status: :unprocessable_entity }
            end
        end
    end

    def update
        @accounts = Account.all
        @account = Account.find(params[:account_id]);

        @account[:name] = params[:name]
        @account[:balance] = params[:balance]

        respond_to do |format|
            if @account.save
                format.html { redirect_to accounts_url, notice: "Account was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @account = Account.find params[:account_id]
        @account.destroy

        respond_to do |format|
            format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
        end
    end
end
