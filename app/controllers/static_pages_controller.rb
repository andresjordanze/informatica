class StaticPagesController < ApplicationController
	def home
		@carrousels = Carrousel.all
  	end

  	def help
 	end
  	
  	def about
  	end
  	
end