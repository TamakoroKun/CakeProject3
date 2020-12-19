class Public::OrdersController < ApplicationController
    
    
  def index
    @user = current_user
    @orderedItemHoge = @user.orderedItem
  end
  
  def new
    @user = current_user
    @orderedItemHoge = @user.orderedItem
  end  
  
  def confirm
    @user = current_user
    @orderedItemHoge = @user.orderedItem
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
