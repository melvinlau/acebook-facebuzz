class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
  end

  def new

  end

  def edit

  end

  private

  def comment_params
    params.permit(:message)

    # TODO
    # params.require(:comment).permit(:message)

  end

end
