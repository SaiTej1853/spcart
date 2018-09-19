class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
  	@products=Product.new
  end

  def create
  	@products=Product.new(shop_params)
  	if @products.save
  		redirect_to{('index')}
  	else
  		render('new')
  	end
  end

  def show
  	@products=Product.find(params[:id])
  end

  def edit
    @shop=Product.find(params[:id])
  end

  def update
    @shop=Product.find(params[:id])
    if @shop.update_attributes(shop_params)
      redirect_to(:action=>'index')
    else
      render('edit')
    end
  end

  def delete
    @shop=Product.find(params[:id])
  end

  def destroy
    @shop=Product.find(params[:id])
    if @shop.destroy
      redirect_to(:action=>'index')
    else
      render('delete')
    end
  end

  private
  def shop_params
  	params.require(:shop).permit(:name, :price, :active, :image)
  end

end
