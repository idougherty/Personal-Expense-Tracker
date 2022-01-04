class Account < ApplicationRecord
    attr_accessor :name, :balance
    has_many :transactions, :dependent => :destroy    
end
