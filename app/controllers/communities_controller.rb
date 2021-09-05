# frozen_string_literal: true

# Communities Controller
class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :find_community, only: %i[show join leave]

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

  def show; end

  def join
    if @community.users.include?(current_user)
      redirect_to community_path(name: @community.name), notice: "You are already a member of #{@community.name}."
    else
      @community.users << current_user
      @community.save
      redirect_to community_path(name: @community.name), notice: "Successfully joined #{@community.name}."
    end
  end

  def leave
    if @community.users.delete(current_user)
      redirect_to community_path(name: @community.name), notice: "Successfully left #{@community.name}."
    else
      redirect_to community_path(name: @community.name), notice: "Looks like you aren't a member of #{@community.name}."
    end
  end

  private

  def find_community
    @community = Community.find_by(name: params[:name])
  end

  def creation_params
    params.require(:community).permit(:name)
  end
end
