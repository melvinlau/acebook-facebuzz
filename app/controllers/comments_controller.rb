class CommentsController < ApplicationController

  before_action :find_post, only: [:edit, :destroy, :show, :update]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to posts_url
  end

  def edit

  end

  def index
    @comments = Comment.all.reverse_order
  end

  private

  def comment_params
    params.permit(:message, :post_id, :user_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
