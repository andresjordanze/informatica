class ProductsController < ApplicationController
	def index
		@products = Product.paginate(:per_page => 6, :page => params[:page])
	end

	def new
		@product = Product.new		
	end

	def create
		@product = Product.new
		@product.save
	end
end
