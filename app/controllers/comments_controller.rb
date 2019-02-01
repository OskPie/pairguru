class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(params[:comment_params])

    if @comment.save
      redirect_to @movie, notice: 'Comment was successfully created.'
    else
      redirect_to '/movies'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :movie_id)
    end
end
