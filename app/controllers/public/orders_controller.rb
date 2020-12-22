class Public::OrdersController < ApplicationController
    
    
  def index
    @customer = current_customer
    #@orderedItemHoge = @customer.orderedItem
  end
  
  def new
    @customer = current_customer
    @addresses = current_customer.addresses
    @address = current_customer.address
  end  
  
  def confirm
    @customer = current_customer
    @orderedItemHoge = @customer.orderedItem
    #payJP
    
    
  end
  
  def create
      #payJPを使うのでいらない？
  end  
  
  def done
    
  end  
  
  def show
        @customer = Customer.find(params[:id])
        @orderedItemHoge = @customer.orderedItem
  end  
    
    
  private
  
  
end
