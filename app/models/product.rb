class Product < ActiveRecord::Base


	attr_accessible :name, :description, :brand, :category, :photo
	
    
	has_one :category	
	belongs_to :brand
    


    
    
    validates :name, presence: {:message => "Debe ingresar el nombre del producto"}	
	validates :name, uniqueness: {case_sensitive: false, :message => "El nombre ya existe"}
	validates :name, format: { with: /\A[a-zA-Z\d\s]+\z/,
    message: "Solo Letras Permitidas" }
    validates :name, length: {minimum: 5, :message => "Minimo 5 caracteres"}
    has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
		:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	 	:default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


    validates :description, presence: {:message => "Debe ingresar una descripcion"}   
    validates :description, length: {minimum: 10, :message => "Minimo 5 caracteres"}

	def correspondeAnombre(nombre)
    	parametros = nombre.split(' ')
    	parametros.each do |parametro|
      	if self.name.downcase.include?(parametro.downcase)
	        return true
    	  end
    	end
    	false
  	end
end
