require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  login_user
  
  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end
  
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do

    it "responds with 200" do
      request.env['HTTP_REFERER'] = '/posts'
      post :create, params: { post: { message: "Hello, world!", user_id: 1, wall_id: 1 } }
      expect(response).to redirect_to request.referer
    end

    it "creates a post" do
      request.env['HTTP_REFERER'] = '/posts'
      post :create, params: { post: { message: "Hello, world!", user_id: 1, wall_id: 1 } }
      expect(Post.find_by(message: "Hello, world!")).to be 
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
