class Public::ItemsController < ApplicationController

require 'payjp'

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

  def purchase
    Payjp.api_key = "秘密鍵"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end  #editied by ふくやま


  private

  def item_params
    params.require(:item).permit(:genre, :name, :image, :introduction, :price, :is_active, :created_at, :updated_at)
  end
end

