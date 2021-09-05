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
    if @community.users.include?(current_user)
      redirect_to community_path(name: @community.name), notice: "You are already a member of #{@community.name}."
    else
      @community.users << current_user
      @community.save
      redirect_to community_path(name: @community.name), notice: "Successfully joined #{@community.name}."
    end
  end

  def leave
    @community = Community.find_by(name: params[:name])
    if @community.users.delete(current_user)
      redirect_to community_path(name: @community.name), notice: "Successfully left #{@community.name}."
    else
      redirect_to community_path(name: @community.name), notice: "Looks like you aren't a member of #{@community.name}."
    end
  end

  private

  def creation_params
    params.require(:community).permit(:name)
  end
end
