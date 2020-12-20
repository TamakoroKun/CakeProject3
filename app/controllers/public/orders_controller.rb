class Public::OrdersController < ApplicationController
    
    
  def index
    @customer = current_customer
    @orderedItemHoge = @customer.orderedItem
  end
  
  def new
    @customer = current_customer
    @orderedItemHoge = @customer.orderedItem
  end  
  
  def confirm
    @customer = current_customer
    @orderedItemHoge = @customer.orderedItem
    #payJP
    
    
  end
  
  def create
      
  end  
  
  def done
      
  end  
  
  def show
      
  end  
  
  def done
      
  end    
    
    
  private
  
  
  
  
  
    
end
