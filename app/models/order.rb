class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
    enum payment_method: {クレジット: 0, 銀行振込: 1}

end
