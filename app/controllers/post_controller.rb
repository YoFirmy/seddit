# frozen_string_literal: true

# Posts Controller
class PostController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @communities = Community.all
    if @communities.length.zero?
      redirect_to new_community_path, notice: 'No Communities exist yet. Please create a community first.'
    else
      @post = current_user.posts.build
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path, alert: 'Post unsuccessful. Please make sure you have selected a community.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :community_id)
  end
end
