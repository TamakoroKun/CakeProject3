class Public::ItemsController < ApplicationController

 def index
     @items = Item.all
     @genres = Genre.all

    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
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

