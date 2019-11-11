class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :user_not_found  

  before_action :authenticate_user!, only: [:profile]

  def profile
    if (@user = User.where(username: params[:username]).first).present?
      @user
    elsif (@user = User.find(params[:id])).present?
      @user
    end

    @post = Post.new

    @posts = Post.where(wall_id: params[:id]).order("created_at DESC")
  end

  
  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def new

  end

  def create
    @user = User.new(user_params)
    p @user
    p user_params
    @user.save!
    p @user.avatarImage.url
  end

  private

  def user_params
    params.require(:user).permit(:avatarImage, :username, :first_name, :last_name, :password, :email)
  end

end
