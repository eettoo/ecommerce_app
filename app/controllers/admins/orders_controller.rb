class Admins::OrdersController < ApplicationController

  def index
     @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
     @order = Order.new
  end

  def create

    @order = Order.create(id_params)
    if @order.save
    redirect_to admins_orders_path
    else
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
     id_param = params.require(:order).permit(:payment_status, :amount, :ship_date, :ship_status, :payment_date)


    @order = Order.find(params[:id])

    if @order.update(id_param)
      redirect_to admins_orders_path
    else
      render 'edit'
    end
end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

  redirect_to admins_orders_path
  end

end

private
  def id_params
    params.require(:order).permit(:payment_status, :amount, :ship_date, :ship_status, :payment_date)
  end
