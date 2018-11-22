class Customer < ApplicationRecord
    # belongs_to :subscription
    has_one :plan
    belongs_to :user
end
