class CommentsController < ApplicationController
	before_filter :load_commentable
	def index
		@comments = @commentable.comments
	end

	def new
		@comment = @commentable.comments.new
	end

	def create
		@comment = @commentable.comments.new(params[:comment])
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to @commentable, notice: "Your comment was posted!"
		else
			render :new
		end
	end
	
	private

	def load_commentable
		resource, id = request.path.split('/')[1,2]
		@commentable = resource.singularize.classify.constantize.find(id)
	end
end
