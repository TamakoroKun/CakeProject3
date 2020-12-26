class Public::ItemsController < ApplicationController

 def index
     @items_before = Item.all
     @genres = Genre.where(is_active: true)
     @items = @items_before.where(is_active: true)

    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items_before = @genre.items
      @items = @items_before.where(is_active: true)
    end

 end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  	@genres = Genre.all
  end




  private

  def item_params
    params.require(:item).permit(:genre, :name, :image, :introduction, :price, :is_active, :created_at, :updated_at)
  end
end

