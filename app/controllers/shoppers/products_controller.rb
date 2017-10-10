class Shoppers::ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@items_basket = ItemsBasket.new
	end

end

