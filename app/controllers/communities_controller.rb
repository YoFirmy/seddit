class CommunitiesController < ApplicationController
  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to community_path(id: @community.id)
    else
      render :new
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
