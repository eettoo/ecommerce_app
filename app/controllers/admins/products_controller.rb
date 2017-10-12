class Admins::ProductsController < ApplicationController

  def index
     @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
     @product = Product.new
  end

  def create
    @product = Product.create(id_params)
    if @product.save
    redirect_to admins_products_path
  else
    render 'new'
  end
end

  def edit
     @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(id_params)
      redirect_to admins_products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

   redirect_to admins_products_path
  end


private
def id_params
  params.require(:product).permit(:name, :description, :price, :gender, :category, :quantity, :image)
end
end
