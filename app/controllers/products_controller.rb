class ProductsController < ApplicationController
	before_action :authenticate_user!, only: [:changeorder, :sort, :new, :create, :edit, :update, :destroy]

	def index
		@products = Product.order(:position)
	end

	def changeorder
		@products = Product.order(:position)
		@disable_footer = true
	end

	def sort
		params[:product].each_with_index do |id, index|
			Product.where(id: id).update_all(position: index + 1)
		end

		head :ok
	end

	def show
		@product = Product.friendly.find(params[:id])
		if !@product.videos.nil?
			@urls = @product.videos.split(',')
		end
	end

	def new
		@product = Product.new
		@disable_footer = true
	end

	def create
		# render plain: params[:product].inspect

		@product = Product.new(product_params)

		if @product.save
	      redirect_to @product
	    else
	      render 'new'
	    end
	end

	def edit
		@product = Product.friendly.find(params[:id])
		@disable_footer = true
	end

	def update
		@product = Product.friendly.find(params[:id])

	    if @product.update(product_params)
	      redirect_to @product
	    else
	      render 'edit'
	    end
	end

	def destroy
		@product = Product.friendly.find(params[:id])
    	@product.destroy

    	redirect_to products_path
	end

	def delete_image_attachment
	    @product_image = ActiveStorage::Attachment.find(params[:id])
	    @product_image.purge

	    respond_to do |format|
	    	format.js
	      	format.html { redirect_to request.referrer }
	    end
	end

	private def product_params
		params.require(:product).permit(:name, :brief, :price, :new_price, :description, :kit, :videos, :cover, images: [], photos: [])
	end
end
