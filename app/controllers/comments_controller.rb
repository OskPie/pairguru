class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Movie.find(params[:movie_id]).comment.new(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, movie: @movie)
  end
end
