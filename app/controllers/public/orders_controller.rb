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
    @order = Order.new(order_params)
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
      @order.postal_code = current_customer.postcode
      @order.name = "#{current_customer.last_name}#{current_customer.first_name}"
      #binding.pry

    elsif params[:order][:address_option] == "1"
      @order.address = Address.find(params[:order][:address_id]).address
      @order.postal_code = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).address

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
    # @order = Order.new(params[:id])


  end

  def create
    #binding.pry
    @order_detail = OrderDetail.new
    @order = current_customer.orders.new(order_params)
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_details.order_id = @order.id
      @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_detail.number_of_items = cart_item.amount #商品の個数を注文商品の個数に代入
      @order_detail.items_tax_included_price = (cart_item.item.price*1.1).floor #消費税込みに計算して代入
      @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
      @order_detail.save #注文商品を保存


    end
    current_customer.cart_items.destroy_all
    redirect_to public_orders_done_path
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


  def order_params
    params.require(:order).permit(:postal_code, :name, :address, :payment_method, :shipping_cost, :total_payment)
  end

end

# Order.create(name: "おなまえ", postal_code: "000-0000", address: "東京都渋谷区道玄坂1-1", shipping_cost: 298, total_payment: 1200
