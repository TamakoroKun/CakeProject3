class Public::CustomersController < ApplicationController
    before_action :reject_inactive_user, only: [:create]
    
    def show
      @customer = Customer.find(current_customer.id)
    end
    
    def edit
      @customer = Customer.find(current_customer.id)
    end
    
    def update
      if @customer.update(customer_params)
        redirect_to customer_path(current_customer), notice: "You have updated customer successfully."
      else
        render "edit"
      end
    end
    
    def unsubscribe　#文字の表示だけ
    end
    
    def withdraw
      @customer = Customer.find(current_customer.id)
      @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
    
    def reject_inactive_customer
      @customer = Customer.find_by(email: params[:customer][:email])
      if @customer
        if @customer.valid_password?(params[:customer][:password]) && !@customer.is_deleted
          redirect_to new_customer_session_path
        end
      end
    end
    
    private
    
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postcode, :address, :phone_number)
    end

end