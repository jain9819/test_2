class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set, only: %i[show edit update destroy] 
	
	def index
		@posts = current_user.posts.includes(:user).all #Post.where(customer_id: current_user.id)
	end

	def new
		@post=Post.new
	end

	def show
	end

	def edit
	end

	def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

	def create
		@post= current_user.posts.new(post_params)
		
		respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity ,notice: "Error"}
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		respond_to do |format|
      if @post.update (post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
	end

	private

		def post_params
			params.require(:post).permit(:title, :description)
		end

		def set
      @post = Post.find(params[:id])
    end


end
