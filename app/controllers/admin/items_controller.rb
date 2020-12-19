class Admin::ItemsController <  ApplicationController



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
    @item.customer_id = current_customer.id
    @item.save
    redirect_to items_path
  end
  
  def edit
     @item = Item.find(params[:id])
  end

  def update
  end


  private

  def item_params
    params.require(:item).permit(:genre, :name, :image, :introduction, :price, :is_active, :created_at, :updated_at)
  end
end

