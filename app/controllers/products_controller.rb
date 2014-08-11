class ProductsController < ApplicationController

	def index
		@products = Product.paginate(:per_page => 6, :page => params[:page])
    @categories = Category.all
    @brands = Brand.all   
	end

	def new
		@product = Product.new
    @categories = Category.all
    @brands = Brand.all		
	end

  def show
      @product = Product.find(params[:id])
  end

  def edit
   	@product = Product.find(params[:id])
    @categories = Category.all
    @brands = Brand.all   
  end

  def create
    @categories = Category.all
    @brands = Brand.all    
   	@product = Product.new(params[:product])

    	if @product.save 
      		flash[:success] = "Producto creado exitosamente!"
      		redirect_to @product
    	else
      		flash[:danger] = "Producto no creado"
      		render action: "new"
    	end
  	end

  def update
  	@product = Product.find(params[:id])
    @categories = Category.all
    @brands = Brand.all   
    if @product.update_attributes(params[:product])
	    flash[:success] = "Producto editado exitosamente!"
      redirect_to @product
      #redirect_to '/productnames'
    else
    	render action: "edit" 
    end
  end

  
  def destroy
    control = true
    @product = Product.find(params[:id])
    @product.productorders.each do |productorder|
      if productorder.product_id = @product.id
        control = false
        flash[:danger] = "No puede eliminar el producto porque existen pedidos asociados a este."    
      end
      break if control == false
    end
    if control == true
      flash[:success] = "Se elimino el producto exitosamente."
      @productname.destroy
    end
    redirect_to productnames_url 
  end

  def search
    #@productnames = buscar(params[:name])
    @productnames = Product.where("name like ?", "%#{params[:name]}%").paginate(:per_page => 6, :page => params[:page])
    render 'index'
  end

  def buscar(nombre)
      items = Array.new 
      aux = Product.all
      if nombre != "" && nombre != nil
          aux.each do |item|
          if (item.correspondeAnombre(nombre))
              items.push(item)
          end
        end
      else
          items = aux
      end
      return items
    end
end

