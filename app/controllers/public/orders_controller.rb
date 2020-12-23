class Public::OrdersController < ApplicationController
    
    
  def index
    @customer = current_customer
    #@orderedItemHoge = @customer.orderedItem
  end
  
  def new
    # @customer = current_customer
    # @addresses = current_customer.addresses
    @order = Order.new
  end  
  
  def confirm
    
    @order = Order.new

    # パラメータで送ったものは全部受け取る
    # 支払いアドレスメールetc...おしなべてコンファームのしたのやつ。それを@ordersの中に入れる。
    # address_optionで送った3種類の方式をどうやって場合分けするのか。
    # ラジオボタンで分けるが、それをどう認識するか。(paramsをif)
    # 直に打って送るタイプのものは場合分けが必要ない(payment_methodのこと)
    # 送料、合計金額もまた@orderに入れたい。
    
    #例）@order.shipping_cost = 800
    #if params[:order][:address_option] == "0"
    # @order.address = current_customer.addres
    if params[:order][:address_option] == "0"
      @order.address = current_customer.address
      #binding.pry

    
    elsif params[:order][:address_option] == "1"
      @order.address = current_customer.addresses
      #current_customer.addressesは仮。adressesをプルダウンから選んでadressに入れたい。
      
    elsif params[:order][:address_option] == "2"
    　@address = Address.new(address_params)
    　@address.customer_id = current_customer.id
    　
    else
      
    end
    @customer = current_customer
  end
  
  def create
    @order = current_customer.orders.new()
  end  
  
  def done
    
  end  
  
  def show
        @customer = Customer.find(params[:id])
        #@orderedItemHoge = @customer.orderedItem
  end  
    
    
  private
  
  
  def address_params
    params.require(:address).permit(:postal_code, :name, :address)
  end
  
end
