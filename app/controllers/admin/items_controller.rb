class Admin::ItemsController <  ApplicationController
  before_action :authenticate_admin!  


  def index
     @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def edit
     @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active, :created_at, :updated_at)
  end
end

