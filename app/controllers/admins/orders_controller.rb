class Admins::OrdersController < ApplicationController

  def index
     @orders = Order.all
  end

  def show
    @order = Order.new(params[:id])
  end

  def new
     @product = Product.new
  end

  def create

    @order = Order.create(product_params)
    if @order.save
    redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

  if @product.update(product_params)
    redirect_to @product
  else
    render 'edit'
  end
end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

  redirect_to admins_product_path
  end

end

private
  def id_params
    params.require(:order).permit(:payment_status, :amount, :ship_date, :ship_status, :payment_date)
  end
