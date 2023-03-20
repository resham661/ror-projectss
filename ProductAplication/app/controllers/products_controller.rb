class ProductsController < ApplicationController
  before_action :find_product, only: [:show]

  def index
    # @products = Product.price_limit
    # debugger
    # @products = Product.price_limit.includes(:brand)
    # @products = Product.includes(:brand).references(:brand).where('brands.brand_name = ?', 'Google')
    @products = Product.price_limit.eager_load(:brand)

  end

  def new
      @product = Product.new
      @product.build_brand
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product was created successfully!"
      redirect_to product_path(@product)     
    else
      render 'new'
    end
  end

  def show
  
  end

  private
  
    def product_params
      params.require(:product).permit(:name, :price, brand_attributes: [:brand_name])
    end

    def find_product
      @product = Product.find(params[:id])
    end

end
