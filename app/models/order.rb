class Order < ApplicationRecord
    belongs_to :customer
    #has_many :
    
    enum payment_method: {クレジット: 0, 銀行振込: 1}

end
