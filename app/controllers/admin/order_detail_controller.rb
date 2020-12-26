class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!  
	
  def index
  	 @order = Order.all
  	 @orders = Order.created_today
  end

def show
	@new_order_item = OrderItem.new
	@new_order_items = New_order_item.all
	@new_order = Order.new
	@order = Order.find(params[:id])
	@order_item = @order.order_items
	@postage = 800
end

def update
	@order = Order.find(params[:id])
	@order_item = @order.order_items
	@order.update(order_status: params[:order][:order_status])
	if @order.order_status == "入金確認"
		@order_item.each do |order_item|
		order_item.update(production_status: "製作待ち")
		end
	end
	redirect_to admin_order_path(@order)
end

def personal_order
	@orders = Order.all
	@end_user = EndUser.find(params[:id])
	@postage = 800
end

 private
  def order_params
  	params.require(:order).permit(:postage, :order_status, :quantity, :end_user_id, :delively_id, :payment, :delivery_name, :Delivery_address, :Delivery_post)
  end
   def order_item_params
 	params.require(:order_item).permit(:order_id, :product_id, :order_item_price, :order_item_name, :production_status, :quantity)
   end
end