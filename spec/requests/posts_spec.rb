require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /post/new" do
    it "returns http success" do
      get "/post/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /" do
    it "responds with 200 given a message" do
      post "/post", params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(root_url)
    end

    it "creates a post" do
      post "/post", params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end
end