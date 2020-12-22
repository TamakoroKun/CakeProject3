class Public::CartItemsController < ApplicationController
	def index
		@customers = current_customers
		@items = @customers.cart_items
	end


	def create
		@cart_items = current_customers.cart_items.new(cart_item_params)
		if @cart_items.save
			redirect_to public_cart_items_path(@items)
		else render :index
		end


		def update
			@items = CartItem.find(params[:id])
			if @items.update(cart_item_params)
				redirect_to public_cart_items_path(@items)
			else render :index
			end
		end

		def destroy
			@items = CartItem.find(params[:id])

			if @items.destroy
				redirect_to public_cart_items_path
			else render :index
			end
		end

		def destroy_all
			@customers = current_customers
			@items = @customers.cart_items
			@items.destroy_all
			redirect_to public_cart_items_path
		else　render :index
		end
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:customers_id, :items_id, :quentity)

	end
end