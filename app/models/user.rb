class User < ApplicationRecord
    has_many :accounts, class_name: "Account", foreign_key: "user_id"
    has_many :transactions, through: :Account
    
    attr_accessor :name

    def editName=(name)
        self[:name] = name
    end
end
