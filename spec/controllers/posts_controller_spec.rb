require 'rails_helper'

RSpec.describe PostController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "when user is not logged in" do
    describe "GET /new " do
      it "responds with 302" do
        get :new
        expect(response).to have_http_status(302)
      end

      it "redirects to log in" do
        get :new
        expect(response).to redirect_to("/user/sign_in")
      end
    end
  end

  context "when user is logged in" do
    before(:each) do
      sign_in create_user
    end

    describe "GET /new " do
      it "responds with 200" do
        get :new
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end
    end

    describe "POST /" do
      before(:each) do
        post :create, params: { post: { message: "Hello, world!" } }
      end

      it "responds with 200 given a message" do
        expect(response).to redirect_to("/")
      end

      it "creates a post" do
        expect(Post.find_by(message: "Hello, world!")).to be
      end
    end
  end
end