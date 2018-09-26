class Customer < ApplicationRecord
    # belongs_to :subscription
    has_one :plan
end
