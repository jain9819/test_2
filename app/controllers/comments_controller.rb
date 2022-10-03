class CommentsController < ApplicationController
	before_action :get_post
	before_action :set, only: %i[show edit update destroy] 
	
	def index
		@comment=Comment.all
	end

	def new
		@comment=Comment.new
	end

	def show
	end

	def edit
	end

	def destroy
		@comment.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
	end

	def create
		@comment= @post.comments.new(description: params[:description])
		respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_url, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		respond_to do |format|
      if @comment.update(description: params[:comment][:description])
        format.html { redirect_to post_url(@post), notice: "Comment was successfully updated." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	end

	private

		def get_post
			@post = Post.find(params[:post_id])
		end

		def set
      @comment = Comment.find(params[:id])
    end

end
