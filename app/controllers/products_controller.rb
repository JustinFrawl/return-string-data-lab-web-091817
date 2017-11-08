class ProductsController < ApplicationController

def index
  @products = Product.all
end
def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

def description
    product = Product.find(params[:id])
    render plain: product.description
  end

def new
  @product = Product.new
end
def create
  Product.create(product_params)
  redirect_to products_path
end
private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end


# t.string   "name"
# t.integer  "price"
# t.datetime "created_at",  null: false
# t.datetime "updated_at",  null: false
# t.integer  "inventory"
# t.string   "description"
