class PagesController < ApplicationController
	def home
		@products = Product.order(:position)
	end

	def garanty

	end

	def about

	end

	def how

	end
end
