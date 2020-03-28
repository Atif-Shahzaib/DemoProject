class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  def index
    @products= Product.all.order("created_at DESC").paginate(page: params[:page], per_page: 9)
  end

  def new
    @product = Product.new
    @proCatItem = ProCatItem.new
    @categories= Category.all
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @product.destroy
    return redirect_to root_path
  end

  def create
    @product = Product.new (product_params)
    @categories= Category.where(params[:product][:categories123])
    @product.categories= @categories
    if @product.save
        redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :image, :categories)
  end

  def find_product
    @product= Product.find(params[:id])
  end

end