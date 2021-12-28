class User < ApplicationRecord
    attr_accessor :name

    has_many :accounts, class_name: "Account", foreign_key: "user_id"
    has_many :transactions, through: :account

    def editName=(name)
        self[:name] = name
    end
end
