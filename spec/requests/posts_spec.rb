require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /post/new" do
    it "returns http success" do
      get "/post/new"
      expect(response).to have_http_status(:success)
    end
  end
end