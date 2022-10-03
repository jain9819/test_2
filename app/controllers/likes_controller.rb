class LikesController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :get_post_comment
	def create
		return render json: {errors: "no record found"}if @record.blank?
		like = @record.likes.new(like_count:  params[:like_count ])
		
		if like.save
			render json: like
		else
			render json: {errors: like.errors.full_messages}
		end
	end

	private 
		def get_post_comment
			if params[:type]=="Post"
				value=Post.find_by_id(params[:likeable_id])
				if value.blank?
					return render json: {errors: "no record found"}
				else
					@record = value
				end
			else
				value = Comment.find_by_id(params[:likeable_id])
				if value.blank?
					return render json: {errors: "no record found"}
				else
					@record = value
			  end
			end
		end
end
