class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    if @address.create(address_params)
      redirect_to address_path(@customer), notice: "You have updated user successfully."
    else
      render "index"
    end      
  end
  
  def update
    if @address.update(address_params)
      redirect_to address_path(@customer), notice: "You have updated user successfully."
    else
      render "edit"
    end      
  end
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: 'address was successfully destroyed!'
  end  
  
end
