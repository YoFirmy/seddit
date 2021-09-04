# frozen_string_literal: true

# Communities Controller
class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(creation_params)
    @community.users << current_user
    if @community.save
      redirect_to community_path(name: @community.name), notice: 'Community created successfully.'
    else
      redirect_to new_community_path, notice: 'That community already exists.'
    end
  end

  def show
    @community = Community.find_by(name: params[:name])
  end
  
  def join
    @community = Community.find_by(name: params[:name])
    @community.users << current_user
    if @community.save
      redirect_to community_path(name: @community.name), notice: 'Successfully joined community.'
    else
      redirect_to root_path, notice: 'Unable to join community.'
    end
  end

  private

  def creation_params
    params.require(:community).permit(:name)
  end
end
