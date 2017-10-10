class Shoppers::ItemsPaidsController < ApplicationController

	def create
		@basketid = Basket.find_by(user_id: current_user.id)
		@itemsbasket = ItemsBasket.where(basket_id: @basket_id)
		
		@itemsbasket.each do |f|

			@itemspaidnew = ItemsPaid.new
			@itemspaidnew.product_id = f.product_id
			# @orderid = Order.find_by(id: params[:id]).id
			@itemspaidnew.order_id = Order.last.id
			@itemspaidnew.price = Product.find_by(id: @itemspaidnew.product_id).price
			@itemspaidnew.quantity = f.quantity
			if @itemspaidnew.save
				flash[:success] = "Items Paid List Successfully Created!"
				redirect_to shoppers_order_items_paids_path(order_id: @itemspaidnew.order.id)
			else
				flash[:danger] = "Items Paid List not Successfully Created!"
				redirect_to shoppers_baskets_path
				# change the above path to where the shopper left his basket at later
			end
		end
	end


end