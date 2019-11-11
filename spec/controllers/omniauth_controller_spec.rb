require 'rails_helper'

RSpec.describe OmniauthController, type: :controller do

  describe "GET #sessions" do
    it "returns http success" do
      get :sessions
      expect(response).to have_http_status(:success)
    end
  end

end
