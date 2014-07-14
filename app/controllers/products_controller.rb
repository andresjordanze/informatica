class ProductsController < ApplicationController
	def index
		@products = Product.paginate(:per_page => 6, :page => params[:page])
	end
end
