class RepliesController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :get_comment

	def index 
		render json: JSON.parse(Comment.all.to_json(include: [:post]))
	end
	def new
		@reply= Comment.new
	end

	def create
		reply = @comment.replies.new(description:  params[:description ])
		
		if reply.save
			render json: reply
		else
			render json: {errors: reply.errors.full_messages}
		end
		# @reply = @comment.comments.new(description: params[:description])
		# respond_to do |format|
  #     if @reply.save
  #       format.html { redirect_to posts_url, notice: "Comment was successfully created." }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #     end
  #   end
	end

	private 
		def get_comment
			@comment = Comment.find(params[:comment_id])		
		end
end
