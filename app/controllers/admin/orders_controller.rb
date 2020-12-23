class Admin::OrdersController < ApplicationController
    
    
    def index
        @orderedItemHoge = @customer.orderedItem
        @orderedItemHoges = orderedItemHoges.all
    end
    
    def show
        @customer = Customer.find(params[:id])
        @orderedItemHoge = @customer.orderedItem
    end
    
    def update
        
    end
    
    
    
end
