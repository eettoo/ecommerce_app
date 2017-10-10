class Shoppers::OrdersController < ApplicationController

	def index
		@myorders = Order.where(user_id: current_user.id)
	end

	def show
		@order = Order.find(params[:id])
		@paid_items =  @order.items_paids
		@productid = @paid_items.pluck(:product_id)
		@productname = Product.find_by(id: @productid).name
	end

	def new
		@neworder = Order.new
	end

	def create
		@ordernew = Order.new
		@ordernew.user_id = current_user.id
		# @itemspaidid = ItemsPaid.where(order_id: @ordernew.id).pluck(:id)
		# not sure if the above will work.
		# @ordernew.items_paid_ids = @itemspaidid
		@ordernew.payment_status = "paid"
		@basket = Basket.find_by(user_id: current_user.id)
		@ordernew.payment_date = @basket.updated_at
		@ordernew.ship_date = @basket.updated_at + 10.days
		# @ordernew.amount = @itemspaidid.pluck(:price).sum
		@ship_status = []
		@ordernew.ship_status = @ship_status

		@basketid = Basket.find_by(user_id: current_user.id)
		@itemsbasket = ItemsBasket.where(basket_id: @basketid)
	
		if @ordernew.save
			flash[:success] = "Your Order is Successful! And we are preparing your package"
			@itemsbasket.each do |f|

				@itemspaidnew = ItemsPaid.new
				@itemspaidnew.product_id = f.product_id
				@itemspaidnew.order = @ordernew
				@itemspaidnew.price = Product.find_by(id: @itemspaidnew.product_id).price
				@itemspaidnew.quantity = f.quantity
				@itemspaidnew.save
			end
			@ordernew[:amount] = @ordernew.items_paids.pluck(:price).sum
			@ordernew.save
			redirect_to shoppers_orders_path
		else
			flash[:danger] = "Your Order is not successfully created, please check if payment has been successfully made"
			redirect_to shoppers_baskets_path
		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to shoppers_orders_path

	end









end