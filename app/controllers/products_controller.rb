class ProductsController < ApplicationController
	before_action :authenticate_user!
	protect_from_forgery with: :null_session
	before_action :set_product, only: %i[show edit update destroy] 

	def index 
		@products = Product.all 
		# render json: @product
	end



	def new
		@product=Post.new
	end

	def show
	end

	def edit
	end

	def create
		@product= Product.new(params.require(:product).permit(:name, :price, :quantity))

    if @product.save
      # render json: @product
      redirect_to post_url(@product), notice: "Post was successfully created."
    else
      render json: {errors: reply.errors.full_messages}
    end  
	end

	
	private
		def set_product
      @product = Product.find(params[:id])
    end
end
