class CommentsController < ApplicationController

  before_action :find_post, only: [:edit, :destroy, :show, :update]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params.merge(user_id: current_user.id, post_id: post_id))

    redirect_to comments_url
  end

  def edit

  end

  def index
    @comments = Comment.all.reverse_order
  end

  private

  def comment_params
    params.permit(:message, :user_id, :post_id)

    # TODO
    # params.require(:comment).permit(:message)

  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
  
end

