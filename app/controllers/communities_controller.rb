# frozen_string_literal: true

# Communities Controller
class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  
  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to community_path(id: @community.id), notice: 'Community created successfully.'
    else
      redirect_to new_community_path, notice: 'That community already exists.'
    end
  end

  def show
    @community = Community.find(params[:id])
  end

  private

  def community_params
    params.require(:community).permit(:name)
  end
end
