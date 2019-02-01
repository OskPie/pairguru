class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params.merge(user_id: current_user.id))
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @movie
    else
      flash.now[:danger] = "error"
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @movie = @comment.movie
    @comment.destroy
    redirect_to '/movies', notice: 'Comment was successfully destroyed.'
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :movie_id)
    end
end
