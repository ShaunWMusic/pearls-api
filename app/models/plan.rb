class Plan < ApplicationRecord
    #  has_one :customer
    belongs_to :customer
    has_one :user

end
