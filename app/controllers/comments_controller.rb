class CommentsController < ApplicationController

	def create
		@video = Video.find(params[:video_id])
		@video.comments.create(comment_params)

		redirect_to video_path(@video)
	end

private
	def comment_params
      params.require(:comment).permit(:author, :body)
    end
end
