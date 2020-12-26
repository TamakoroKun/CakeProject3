class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
    enum payment_method: {クレジット: 0, 銀行振込: 1}
    
    enum order_status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]

  after_update do
    if self.order_status == "入金確認"
      self.order_details.each {|order_detail|
      order_detail.update(item_status: "製作待ち")
      }
    end
  end
end
