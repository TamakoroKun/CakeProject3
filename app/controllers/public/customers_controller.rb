class Public::CustomersController < ApplicationController
    before_action :reject_inactive_user, only: [:create]

    def show
      @customer = Customer.find(current_customer.id)
    end

    def edit
      @customer = Customer.find(current_customer.id)
    end

    def update
      @customer = Customer.find(current_customer.id)
      if @customer.update(customer_params)
        redirect_to customers_my_page_path(current_customer), notice: "You have updated customer successfully."
      else
        render "edit"
      end
    end

    def unsubscribe#文字の表示だけ
    end

    def withdraw
      @customer = Customer.find(current_customer.id)
      @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end

    private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postcode, :address, :phone_number)
    end

end