class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
     @items = Item.all
    @orders = Order.where("created_at" === Date.today)
  end

end
