class Product < ActiveRecord::Base
	has_one :category
	belongs_to :brand
end
