class Public::ItemsController < ApplicationController

 def index
     @items = Item.all
 end

  def show
    @item = Item.find(params[:id])
     @cart_item = CartItem.new
  	@genres = Genre.all
  end




  private

  def item_params
    params.require(:item).permit(:genre, :name, :image, :introduction, :price, :is_active, :created_at, :updated_at)
  end
end

