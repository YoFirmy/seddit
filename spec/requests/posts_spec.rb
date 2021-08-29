require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before(:each) do
    sign_in create_user
  end

  describe "GET /post/new" do
    it "returns http success" do
      get "/post/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /" do
    before(:each) do
      post "/post", params: { post: { message: "Hello, world!" } }
    end

    it "responds with 200 given a message" do
      expect(response).to redirect_to(root_url)
    end

    it "creates a post" do
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end
end