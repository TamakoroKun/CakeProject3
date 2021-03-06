class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!  

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path, notice: "You have updated customer successfully."
    else
      render "edit"
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postcode, :address, :phone_number, :is_deleted)
  end

end
