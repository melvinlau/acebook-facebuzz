class PostsController < ApplicationController

  before_action :signed_in
  before_action :find_post, only: [:edit, :destroy, :show, :update, :upvote, :downvote]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to request.referrer
  end

  def index
    @wall_id = current_user.id
    @post = Post.new
    @posts = Post.all.order("created_at DESC")
  end

  def index_by_user

  end

  def edit
    @post = Post.find(params[:id])
    @wall_id = @post.wall_id
    session[:request] = request.referrer
  end

  def destroy
    @post.destroy
    redirect_to request.referrer
  end

  def show

  end

  def update
    if @post.update(post_params)
      redirect_to session[:request]
    else
      render 'edit'
    end
  end

  def upvote
    @post.upvote_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_url }
      format.js { render layout: false }
    end
  end

  def downvote
    @post.downvote_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_url }
      format.js { render layout: false }
    end
  end

  private

  def post_params
    params.require(:post).permit(:wall_id, :message, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def signed_in
    redirect_to '/' unless user_signed_in?
  end

end
