class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    #注文数カウント、注文日でif文
    # @orders = Order.all
    # @order = Order.find_by(released_date: today)

    @addresses = Address.all
  end

end
