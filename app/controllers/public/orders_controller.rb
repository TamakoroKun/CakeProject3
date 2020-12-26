class Public::OrdersController < ApplicationController


  def index
    @customer = current_customer
    @orders = current_customer.orders
    # @orderItems = current_customer.items
    #@orderedItemHoge = @customer.orderedItem
    #Itemsを呼ぶ必要があるが、Itemにはaddressなどが入ってない。これをeachでまとめて呼ぶ方法をメンターに相談する。
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

      @address = Address.new
      @address.customer_id = current_customer.id
      @address.postal_code = params[:order][:postal_code]
      @address.name = params[:order][:name]
      @address.address = params[:order][:address]

    else

    end
    @customer = current_customer
    @cart_items = current_customer.cart_items
    @order = Order.new(params[:id])


  end

  def create
    #binding.pry
    @order = current_customer.orders.new(address_params)
  end

  def done

  end

  def show
    @customer = Customer.find(params[:id])
    #@orderedItemHoge = @customer.orderedItem
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


  private


  def address_params
    params.require(:address).permit(:postal_code, :name, :address)
  end

end


# Order.create(name: "おなまえ", postal_code: "000-0000", address: "東京都渋谷区道玄坂1-1", shipping_cost: 298, total_payment: 1200